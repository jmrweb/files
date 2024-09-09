# **Firewalls** #

1. Cisco
2. Juniper
3. iptables
4. firewalld
5. ufw
6. pfsense

## **What to block** ##

- All ICMP traffic originating from the Internet
    
- Any traffic directed specifically to the firewall
    
- Any traffic to known closed ports
    
- Any traffic to known ports of known malware
  - 31337 (Back Orifice)

- Inbound TCP 53
  - blocks external zone transfer requests
        
- Inbound UDP 53
  - blocks external DNS user queries
        
- Any traffic from IP addresses on a blacklist
    
- Any traffic from internal IP addreses that are not assigned
    

## **Monitoring Firewalls** ##
    
- ### **Tools** ###
  - nmap
  - netstat
  - tcpview
  - fport
  - snort
  - Nessus
  - OpenVAS
  - Wireshark
  - netcat
  - Backtrack
  - Syslog
    
    

