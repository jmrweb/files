# Port Scanning

- Begin scan with port 80 and 443 to identify web servers
- Run more detailed scan of webservers while conducting other enumeration.
- Conduct narrower scans of services when ports are revealed

--------------------------------------------------------------------------
## Scan

- TCP scan

      sudo nmap -Pn -sS -sC -sV -O -p- -T4 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_TCP

- UDP scan

      sudo nmap -Pn -sU --open -p- -T4 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_UDP

- Vuln Scan

      sudo nmap -sV -p <discovered_ports> --script "vuln" -T4 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_vuln

      sudo nmap -sV -p <discovered_ports> --script "vuln and vulscan/"" --script-args vulscandb=cve.csv -T4 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_vuln


--------------------------------------------------------------------------
## Tools

[nmap](../Tools/nmap.md)
[netcat](../Tools/netcat.md)
[Masscan](https://www.kali.org/tools/masscan/)
[Rustscan](https://rustscan.github.io/RustScan/)


--------------------------------------------------------------------------
## Windows
#windows/powershell

Test-NetConnection: (PowerShell)
https://learn.microsoft.com/en-us/powershell/module/nettcpip/test-netconnection?view=windowsserver2022-ps

	Test-NetConnection -Port $TARGET_IP
	
Scan range: (PowerShell)

	1..1024 | % {echo ((New-Object Net.Sockets.TcpClient).Connect("$TARGET_IP", $_)) "TCP port $_ is open"} 2>$null




