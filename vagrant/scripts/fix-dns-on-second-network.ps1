param ([String] $ip, [String] $dns)

$name = (Get-NetIPAddress |Where-Object -FilterScript {$_.IPv4Address -eq $ip }).InterfaceAlias

       
Write-Verbose "Set DNS server address to $dns of interface $name"
& netsh.exe interface ipv4 add dnsserver "$name" address=$dns index=1
