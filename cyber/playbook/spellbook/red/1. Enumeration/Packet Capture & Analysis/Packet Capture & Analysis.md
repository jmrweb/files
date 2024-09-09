# Packet Capture & Analysis

- IP version being used (IPv4/IPv6):
- Protocol being used (TCP/UDP/ICMP):
- Source port:
- Destination port:
- Client IP address:
- Server IP address:
- Client MAC address:
- MAC address of the router:
- Determine the nature of the traffic:

## tcpdump
https://packetlife.net/media/library/12/tcpdump.pdf

- Capture all traffic on an interface

	  sudo tcpdump -i <capture_interface>

- Capture traffic with host ip address, protocol, and port
    
	  sudo tcpdump -i <capture_interface> host <target_address> and udp and port 53
	  

## airodump-ng

- Wireless traffic capture
    
	  iwconfig <capture_interface> mode monitor
	  airodump-ng --bssid <target_bssid> -c <target_channel> -w <capture_file> <capture_interface>
