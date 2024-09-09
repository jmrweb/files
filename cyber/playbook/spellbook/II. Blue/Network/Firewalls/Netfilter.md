# netfilter
- operates in kernelspace
?Can do kernel level packet filtering?
- compile and run as kernel module?

# Functionality
- Packet filtering
- Connection tracking (Stateful filtering)
- NAT
- Further packet modification

## Hooks

- NF_INET_PRE_ROUTING
	- Tiggers 
	- makes **routing** decistion to NF_INET_LOCAL_IN
	  OR
	- NF_INET_FORWARD
- NF_INET_LOCAL_IN
	- passes packet to **Network Stack**
- NF_INET_LOCAL_OUT
	- packets leave **Network Stack** through this hook
	-  packers get routed to NF_INET_POST_ROUTING
- NF_INGER_FORWARD
- NF_INET_POST_ROUTING

## Implmenting a simple firewall

