# Purpose: Sets timezone to UTC, sets hostname, creates/joins domain.
# Source: https://github.com/StefanScherer/adfs2

$box = Get-ItemProperty -Path HKLM:SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName -Name "ComputerName"
$box = $box.ComputerName.ToString().ToLower()

if ($env:COMPUTERNAME -imatch 'vagrant') {

  Write-Verbose 'Hostname is still the original one, skip provisioning for reboot'

  Write-Verbose 'Install bginfo'
  . c:\vagrant\scripts\install-bginfo.ps1

  Write-Verbose "Hint: vagrant reload $box --provision"

} elseif ((gwmi win32_computersystem).partofdomain -eq $false) {

  Write-Verbose "Current domain is set to 'workgroup'. Time to join the domain!"

  if (!(Test-Path 'c:\Program Files\sysinternals\bginfo.exe')) {
    Write-Host 'Install bginfo'
    . c:\vagrant\scripts\install-bginfo.ps1
  }

  if ($env:COMPUTERNAME -imatch 'dc') {
    . c:\vagrant\scripts\create-domain.ps1 -ip 172.25.0.100 -domain "windomain.local" -verbose
  } else {
    . c:\vagrant\scripts\join-domain.ps1
  }
  Write-Verbose "Hint: vagrant reload $box --provision"

} else {

  Write-Verbose "I am domain joined!"

  if (!(Test-Path 'c:\Program Files\sysinternals\bginfo.exe')) {
    Write-Verbose "Install bginfo"
    . c:\vagrant\scripts\install-bginfo.ps1
  }

}
