# Port Scanning

- ### Default Scan
	
	  sudo nmap -sC -sV -p- -n <target_address>

- ### Syn-scan
  
  Always start with a stealthy scan to avoid closing ports.

	  nmap -sS <target_address>

- ### Ping-scan

  Scan for active hosts but not ports

	  nmap -sn <target_address>

- ### Scan all tcp ports
 
      nmap -p- <target_address>

- ### Scan for udp
    
	  nmap -sU <target_address>

- ### Service/version and default script scan
    
	  nmap -p <port_range> -sC -sV <target_address>

- ### Monster scan

	  nmap -p- -A -T4 <target_address>

- ### Store scanned ports as csv in environment variable

	  ports=$(nmap -p- --min-rate=1000 -T4 <target_address> | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//) && nmap -sC -sV -p $ports <target_address>

  Enumerate and store open tcp ports

	  ports=$(nmap -p- --min-rate=1000 -T4 <target_address> | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//) 
	  
  Service/version and default script scan stored ports
  
	  nmap -sC -sV -p $ports <target_address>

  
# Nmap scripts
    
- /usr/share/nmap/scripts
