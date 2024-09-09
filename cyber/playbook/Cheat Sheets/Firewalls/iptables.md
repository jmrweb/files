# iptables
https://netfilter.org/projects/iptables/index.html

- userspace configuration utility for **Xtables**
	- Xtables ia its kernelspace firewall/filtering module
	- Xtables is built on Netfilter


## Tables and chains
iptables operates on a syntax of "tables" and "chains"

| Tables	| Chains																							| Description 																						|
|---------|-------------------------------------------------|--------------------------------------------------------| 
| filter	| INPUT, FORWARD, OUTPUT														|Packet filtering 																					|
| nat			| PREROUTING, INPUT, OUTPUT, POSTROUTING 					| Modifying source or destination INPUT network addresses	|
| mangle	| PREROUTING, INPUT, FORWARD, OUTPUT, POSTROUTING	| Packet content modification 														|


## command format

	iptables [-t <table>] -<operation> <chain> <rule> -j <target>
  
- Default `<table>` is **filter**

- ### `<rule>` options

	- Layers 2 and 3

	      -i interface (incoming)
	      -o interface (outgoing)

	      -s <source_ip>
	      -d <destination_ip>
	
	- TCP/UDP/ICMP

			- p protocol [protocol specific rule]

- ### `<target>` actions
  - ACCEPT
  - DROP
  - RETURN
  - LOG
  - Target Extension (SNAT, TOX, TTL, etc)


## Command Examples

- list/delete all rules:

      sudo iptables [-t <table>] -L -n
      sudo iptables [-t <table>] -F
	

- list/deleate rules with line numbers:

      sudo iptables [-t <table] -L -n --line-numbers
      sudo iptables [-t <table] -D <chain> <line_number>
	
- Block IP:

      sudo iptables -A INPUT -s 192.168.30.6 -d 192.168.1.0/24 -j DROP

- Open TCP ports 22 and 80:
   
      sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
      sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
      
- Allow all outgoing TCP traffic:

      sudo iptables -A OUTPUT -p tcp -j ACCEPT
	   
## Stateful Firewall/Connection Tracking

- ### Connection States
  - NEW
  - ESTABLISHED
  - RELATED
  - INVALID

- ### Check tracked connections

      sudo conntrack - L
	
- ### Using Connection Tracking

      sudo iptables -A INPUT -p tcp -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT
	
	
- ### Examples:

      // allowing SYN packets to ports 22, 80, and 443
      iptables -A FORWARD -p tcp -i eth0 --dport 22 --syn -m conntrack --ctstate NEW -j ACCEPT
      iptables -A FORWARD -p tcp -i eth0 --dport 80 --syn -m conntrack --ctstate NEW -j ACCEPT
      iptables -A FORWARD -p tcp -i eth0 --dport 443 --syn -m conntrack --ctstate NEW -j ACCEPT
	
      // Allowing TCP packets if they belong to an existing connection
      iptables -A FORWARD -p tcp -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
	
      // Set the default policy to DROP
      iptables -P FORWARD DROP
	  
	  
## Traffic limiting

- ### Example

      iptables -A FORWARD -s 10.9.0.5 -m limit --limit 10/minute --limit-burst 5 -j ACCEPT
      iptables -A FORWARD -s 10.9.0.5 -j DROP
	  
	   
## NAT

- ### Using iptables for Source NAT 
  - Modify Source IP: Source NAT (SNAT)
 	
	      sudo iptables -t nat -A POSTROUTING -o enp0s3 -j SNAT --to-source 10.0.2.7

  - IP Masquerading and NAT 

	      sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

- ### Destination NAT:  Port forwarding

      sudo iptables -t nat -A PREROUTING -p tcp --dport 8000 -j DNAT --to-destination 192.168.60.5:23

- ### Destination NAT: Load Balancing

      sudo iptables -t nat -A PREROUTING -p tcp --dport 8000 -m statistic --mode random --probability P1 -j DNAT --to-destination 192.168.60.5:8000         
 
      sudo iptables -t nat -A PREROUTING -p tcp --dport 8000 -m statistic --mode random --probability P2 -j DNAT --to-destination 192.168.60.6:8000  
 
      sudo iptables -t nat -A PREROUTING -p tcp --dport 8000 -m statistic --mode random --probability P3 -j DNAT --to-destination 192.168.60.7:8000 

  - Load Balancing: Use Another Module

	      sudo iptables -t nat -A PREROUTING -p tcp --dport 8000 -m statistic --mode nth --every 3 --packet 0 -j DNAT --to-destination 192.168.60.5:8000         
 
	      sudo iptables -t nat -A PREROUTING -p tcp --dport 8000 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 192.168.60.6:8000        
 
	      sudo iptables -t nat -A PREROUTING -p tcp --dport 8000 -j DNAT --to-destination 192.168.60.7:8000 


## Matching and targeting extensions

	iptables [-t filter] -A INPUT  <rule>  -j <target>
	
- Matching Examples:  the Limit Module

      sudo iptables -A INPUT -p icmp -m limit --limit 10/min --limit-burst 5 -j ACCEPT
      sudo iptables -A INPUT -p icmp -j DROP
      sudo iptables -m limit -h

- Targeting Examples: 
	
	- The SNAT and DNAT Target Extension (nat table)
	
	- Increase the TTL field of all packets by 5 (mangle table)

	      sudo iptables -t mangle -A OUTPUT -j TTL --ttl-inc 5