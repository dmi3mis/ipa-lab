# Purpose: Joins a Windows host to the windomain.local domain which was created with "create-domain.ps1".
# Source: https://github.com/StefanScherer/adfs2

param ([String] $ip, [String] $dns,  [String] $domain)

Write-Host 'Join the domain'

Write-Host "First, set DNS to DC to join the domain"


$Interface = Get-WmiObject Win32_NetworkAdapterConfiguration 
Write-Host "$(Get-Date -format T):Registering DNS $dns for $hostname" -ForegroundColor Green
$Interface.SetDNSServerSearchOrder($dns)

Write-Host "Now join the domain"

$user = "$domain\vagrant"
$pass = ConvertTo-SecureString "vagrant" -AsPlainText -Force
$DomainCred = New-Object System.Management.Automation.PSCredential $user, $pass

Write-Host  "Adding Win10 to the domain. Sometimes this step times out. If that happens, just run 'vagrant reload win10 --provision'"
Add-Computer -DomainName $domain -credential $DomainCred