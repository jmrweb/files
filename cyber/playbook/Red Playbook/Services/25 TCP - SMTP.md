# Simple Mail Transfer Protocol (SMTP)

Port: 25 TCP

Application:
Version:
VRFY:
EXPN:

--------------------------------------------------------------------------

## Discovery Scans

- nmap discovery scan (safe)

      sudo nmap -p 25 --script="(safe and not vuln) and smtp*" --script-args newtargets $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_25_discovery_safe

- nmap discovery scan (intrusive)

      sudo nmap -p 25 --script="(discovery and auth and broadcast and intrusive) and smtp*" --script-args newtargets $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_25_discovery_intrusive
      
--------------------------------------------------------------------------

## Vuln Scans

- nmap vuln scan (safe)

      sudo nmap -p 25 --script="vuln and safe and (vulners or smtp*)" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_25_vuln_safe

- nmap vuln scan (intrusive)

      sudo nmap -p 25 --script="vuln and intrusive and smtp*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_25_vuln_intrusive
      
--------------------------------------------------------------------------

## Enumerate commands

- nmap
      
      sudo nmap -p 25 --script=smtp-commands $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_25_commands

- See also:
  [SMTP Commands](#SMTP%20Commands)
  
--------------------------------------------------------------------------

## Enumerate users

- nmap 

    sudo smtp-user-enum -U /usr/share/seclists/Usernames/Names/names.txt -t $TARGET_IP

- See also:
  [nmap](../Tools/nmap.md) (smtp-enum-users.nse <- finicky)
  [SMTP Commands](#SMTP%20Commands)

--------------------------------------------------------------------------

## Brute force passwords

      sudo nmap -p 25 --script=smtp-brute $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_25_brute

--------------------------------------------------------------------------

## SMTP Commands
[smtp commands](http://www.suburbancomputer.com/tips_email.htm)

Show available commands:
`HELO` Identify yourself to the SMTP server.
`EHLO` Extended HELO (Show available commands)
`HELP` Show available commands

Enumerate Users:
`VRFY` Ask the server to verify an email address
`EXPN` Ask the server for the membership of a mailing list

--------------------------------------------------------------------------

## GUI Application
snmpcheck

--------------------------------------------------------------------------

## Windows
#windows 

### Enum with telnet:

- Install telnet:

      dism /online /Enable-Feature /FeatureName:TelnetClient

  or transfer from another machine from:

      c:\windows\system32\telnet.exe

- Banner grab:

      telnet $TARGET_IP 25

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------

## Backup

- Joel's nmap script scans:
  
      nmap --script=smtp-commands,smtp-enum-users,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 -p 25 $TARGET_IP

      nmap --script=smtp-ntlm-info.nse,smtp-open-relay.nse,smtp-strangeport.nse -p 25 $TARGET_IP

- ### Basic python script
  banner grab + check if user exists

  ```python
  #!/usr/bin/python

  import socket
  import sys

  if len(sys.argv) != 3:
          print("Usage: vrfy.py <username> <target_ip>")
          sys.exit(0)

  # Create a Socket
  s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

  # Connect to the Server
  ip = sys.argv[2]
  connect = s.connect((ip,25))

  # Receive the banner
  banner = s.recv(1024)

  print(banner)

  # VRFY a user
  user = (sys.argv[1]).encode()
  s.send(b'VRFY ' + user + b'\r\n')
  result = s.recv(1024)

  print(result)

  # Close the socket
  s.close()
  ```