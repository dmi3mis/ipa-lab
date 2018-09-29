# Purpose: Creates the "windomain.local" domain
# Source: https://github.com/StefanScherer/adfs2
param ([String] $ip,[string] $domain)

$subnet = $ip -replace "\.\d+$", ""

if ((gwmi win32_computersystem).partofdomain -eq $false) {

  Write-Verbose "Installing RSAT tools"
  Import-Module ServerManager
  Add-WindowsFeature RSAT-AD-PowerShell,RSAT-AD-AdminCenter

  Write-Verbose "Creating domain controller"
  # Disable password complexity policy
  secedit /export /cfg C:\secpol.cfg
  (gc C:\secpol.cfg).replace("PasswordComplexity = 1", "PasswordComplexity = 0") | Out-File C:\secpol.cfg
  secedit /configure /db C:\Windows\security\local.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY
  Remove-Item -force C:\secpol.cfg -confirm:$false

  # Set administrator password
  $computerName = $env:COMPUTERNAME
  $adminPassword = "vagrant"
  $adminUser = [ADSI] "WinNT://$computerName/Administrator,User"
  $adminUser.SetPassword($adminPassword)

  $PlainPassword = "vagrant" # "P@ssw0rd"
  $SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force

  # Windows Server 2016 R2
  Install-WindowsFeature AD-domain-services
  Import-Module ADDSDeployment

  $netbiosdomainname=$domain.Split(".")[0].ToUpper() 

  Install-ADDSForest `
    -SafeModeAdministratorPassword $SecurePassword `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "7" `
    -DomainName $domain `
    -DomainNetbiosName  $netbiosdomainname `
    -ForestMode "7" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$true `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true

  # $newDNSServers = "8.8.8.8", "4.4.4.4"
  #$adapters = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPAddress -And ($_.IPAddress).StartsWith($subnet) }
  #if ($adapters) {
  #  Write-Host Setting DNS
  #  $adapters | ForEach-Object {$_.SetDNSServerSearchOrder($newDNSServers)}
  #}
  
  Write-Verbose "Excluding NAT interface from DNS"

  $nics=Get-WmiObject "Win32_NetworkAdapterConfiguration where IPEnabled='TRUE'" |? { $_.IPAddress[0] -eq "$ip" }
  $dnslistenip=$nics.IPAddress
  $dnslistenip
  dnscmd /ResetListenAddresses  $dnslistenip
  
  $nics=Get-WmiObject "Win32_NetworkAdapterConfiguration where IPEnabled='TRUE'" |? { $_.IPAddress[0] -ne "$ip" }
    
  foreach($nic in $nics)
  {
  $nic.DomainDNSRegistrationEnabled = $false
  $nic.SetDynamicDNSRegistration($false) |Out-Null
  }

   #Get-DnsServerResourceRecord -ZoneName windomain.local -type 1 -Name "@" |Select-Object HostName,RecordType -ExpandProperty RecordData |Where-Object {$_.IPv4Address -ilike "10.*"}|Remove-DnsServerResourceRecord
   $RRs= Get-DnsServerResourceRecord -ZoneName $domain -type 1 -Name "@"
  
   foreach($RR in $RRs)
   {
    if ( ($RR.RecordData).IPv4Address -ilike "10.*")
    { 
    Remove-DnsServerResourceRecord -ZoneName $domain -RRType A -Name "@" -RecordData $RR.RecordData.IPv4Address -Confirm:$false
    }
  
   }
  Restart-Service DNS

}
