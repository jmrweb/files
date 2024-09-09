# Banner Grabbing

## nmap
	nmap -sV --script=banner <target_address>

## netcat

- TCP

	  nc -nv <target_address> <target_port>
	  
- UDP

	  nc -nv <target_address> -u <target_port>

## telnet

	telnet <target_address> <target_port>
	
## cURL

	curl -s -I http://target.example.com | grep -e "Server: "
	
	curl --head http://target.example.com
	
## wget

	wget -q -S target.example.com