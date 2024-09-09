# nmap
#nmap

https://nmap.org/
https://nmap.org/book/nmap-services.html
https://github.com/21y4d/nmapAutomator

## Options

`-A` Enable OS version detection, script scanning, and traceroute
`-n` No domain lookup (faster scan)
`-sn` Ping scan
`-sS` Syn scan (default when run with root privileges)
`-sT` TCP connect scan (default when run without root privileges)
`-sU` UDP scan
`-sC` run default scripts
`-sV` version scan
`-O` OS fingerprinting
`--osscan-guess` Force display of low confidence OS fingprinting
`-p` specify port number
`--top-ports <n>` scan the n highest-ratio ports
`-T<0-5>` set timing
`-oG <filename>` Output grepable results to file

## Host Discovery
https://nmap.org/book/man-host-discovery.html

- Host scan (default):
     
      nmap -sn $TARGET_NETWORK

- Ping scan (override arp based discovery on local network):

      nmap -sn $TARGET_NETWORK --send-ip

- Syn scan (common ports):
  https://nmap.org/book/synscan.html
    
      nmap -sn -PS21,22,25,80,139,443,445,3389,8080 $TARGET_NETWORK

- Ack scan (common ports):
    
      nmap -sn -PA21,22,25,80,139,443,445,3389,8080 $TARGET_NETWORK

- UDP scan (common ports):

      nmap -sn -PU137,138 $TARGET_NETWORK

## Port Scans

- Default Syn Scan:
  https://nmap.org/book/synscan.html
    
      sudo nmap -sC -sV -O -p- -n $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_port_syn

- SNMP scan

      sudo nmap -sU --open -p 161 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_port_snmp

- Full UDP scan
  https://nmap.org/book/scan-methods-udp-scan.html

      sudo nmap -sU -sC -sV -p- -n $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_port_udp

- Full Scan:

      sudo nmap -sU -sS -A -O -p- -n $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_port_full


- TCP connect scan (default scan type when run without root privileges):
  https://nmap.org/book/scan-methods-connect-scan.html

      sudo nmap -sT $TARGET_IP

    - Performs full TCP connection
    - Slower, less stealthy
    - Useful in certain situations (I.E. scanning via certai ntypes of proxies)


- OS detection:
  https://nmap.org/book/osdetect.html

      sudo nmap -O $TARGET_IP

      sudo nmap -O $TARGET_IP --osscan_guess

Store scanned ports as csv in environment variable:

- Enumerate and store open tcp ports.

		ports=$(nmap -p- --min-rate=1000 -T4 $TARGET_IP | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
	
- Service/version and default script scan stored ports.
  
		nmap -sC -sV -p $ports $TARGET_IP

- One liner.

		ports=$(nmap -p- --min-rate=1000 -T4 $TARGET_IP | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//) && nmap -sC -sV -p $ports $TARGET_IP

## Grepping nmap
https://nmap.org/book/output-formats-grepable-output.html

- Output greppable results to file

      -oG <filename>`

- Grep live hosts:

      grep Up <filename> | cut -d " " -f 2

- Grep open ports

      grep open <filename> | cut -d" " -f2


## Nmap Scripting Engine (NSE)
https://nmap.org/book/nse.html
https://nmap.org/nsedoc/scripts/
    
/usr/share/nmap/scripts

Options:

  `--script <script>` run specified script
  `--script-help <script>` show script description and doc URL
  `--script-updatedb` update scriptdb after installing custom scripts

Script categories:

  https://nmap.org/book/nse-usage.html

  - View scripts in a specific category:

        nmap --script-help="<category> and <protocol>-*"* -oX - | awk -F\" '/^<script /{print $2}' | xargs basename -s .nse

  - Example:

        nmap --script-help="discovery and http-*" -oX - | awk -F\" '/^<script /{print $2}' | xargs basename -s .nse

Vuln scanning

  - vulners, vulscan
    https://null-byte.wonderhowto.com/how-to/easily-detect-cves-with-nmap-scripts-0181925/

        'git clone https://github.com/scipag/vulscan.git'
      
        'nmap --script vulners,vulscan/ --script-args vulscandb=cve.csv -sV $TARGET_IP'

## Notable scripts:

- ### HTTP
  http-headers
    - connect to the HTTP service on a target system and determine the supported headers

- ### SMB
  smb-os-discovery (discovery, safe)
    - Provides OS fingerprinting info
    - Stealthier and more detailed than nmap -O scan

  smb-protocols (discovery, safe)
    - SMB version? (v1 is vulnerable to EternalBlue)
  
  smb-security-mode (discovery, safe)
    - Is there a guest account?

  smb-enum-sessions (discovery, intrusive)
    - User activity
  
  smb-enum-shares (discovery, intrusive)
    - Are there shares with anonymous access?
    - Access levels?
    - IPC share? (null session access)
  
  smb-ls (discovery, intrusive)
    - Examine contents of accessible shares

  smb-server-stats (discovery, intrusive)
    - Failed logins, permission + system errors, opened files, print jobs

  smb-enum-domains (discovery, intrusive)
    - Enumerate domains
  
  smb-enum-groups (discovery, intrusive)
    - Enumerate groups  
  
  smb-enum-services (discovery, intrusive)
    - Enumerate running services
  
  smb-enum-users (auth, intrusive)
      - Usernames
      - Password requirements