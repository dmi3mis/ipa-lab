# wait until we can access the AD. this is needed to prevent errors like:
#   Unable to find a default server with Active Directory Web Services running.
Write-Verbose "Wait if domain can be contacted..."
while ($true) {
    try {
        Get-ADDomain | Out-Null
        break
    } catch {
        Start-Sleep -Seconds 3
    }
}
Write-Verbose "Now domain can be contacted. We can proceed"    


