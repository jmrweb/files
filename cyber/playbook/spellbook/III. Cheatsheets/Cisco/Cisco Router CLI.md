Cisco Router CLI

EXEC Mode
    
    enable                                    -move to enable (privileged) mode

disable                                    -move from enable mode to user mode

quit                                    -disconnect user from CLI session

copy running-config startup-config                    -running-config to startup-config

    terminal length terminal-length                        -set number of output lines

show interface interface-id                        -show extended interface info

show ip interface brief                            -show brief interface info

show ip route [connected | static | rip]                     -showrouting table or subset of routing table

show ip route ip-address                        -show routing info for the destination ip address

show ip route | section subnet                        -show section of routing table beginning with subnet

show ip protocols                            -show information about the RIP configuration and IP addresses of neighboring
 RIP routers that the local router has learned routes from

    show ip rip database                            -show information about all routes known by the local RIP process, including
 those not added to local routing table

    show ip dhcp binding                            -list the currently leased IP addresses along with client identifier and lease
 information

    show ip dhcp pool name                            -list the configured range of addresses in the specified pool along with usage
 statistics

    show ip dhcp server statistics                        -show statistics about requests served by DHCP server

    show ip dhcp conflict                            -show IP addresses that the DHCP server found were already in use

    clear ip dhcp conflict                            -remove all entries from the DHCP conflict list

    show ip access-lists [access-list-number | access-list-name]        -show IP access lists

show access-lists [access-list-number | access-list-name]        -show details of specified access lists for all protocols 

show vlans                                -show vlan configuration

show protocols interface-id                        -show interface protocol info

show controllers interface-id                          -show interface hardware controller info

show arp, show ip arp                            -show arp table

clear ip arp                                -clear arp table

show standby [brief]                            -list details about HSRP status


Global Configuration Mode

    configure terminal                            -move user from exec mode to configuration mode

hostname name                                -set hostname for router

exit                                    -move back to higher config mode

end                                    -move back to enable mode from any config submode

ctrl+z                                    -same as end command

enable secret pass-value                        -set password for enable mode

    ip route network-address mask {next-hop-ip-address | interface-id}    -create a static route, permanent ignores configuration checks when adding
[distance] [permanent]                               route to routing table

ip dhcp excluded-address first last                    -reserve an inclusive range of addresses that DHCP server function will not lease

access-list access-list-number {deny | permit}                -create standard numbered access lists from 1-99 or 1300-1999
source [source-wildcard] [log]

access-list access-list-number {deny | permit}                -create extended numbered access lists from 100-199 or 2000-2699
protocol source source-wildcard destination destination wildcard [log]

access-list access-list-number remark text                -defines a remark that helps you remember what the ACL is supposed to do


Interface Submode

interface interface-id                            -move to config mode for specified interface

[no] shutdown                                -enable and disable interface

[no] speed {10 | 100 | 1000}                        -manually set speed of current interface(s), no reverts to default

[no] duplex {auto | full | half}                        -manually set duplex setting of current interface(s), no reverts to default

[no] description text                            -set informational text for interface, no reverts to none

ip address address mask                        -set ip address and mask for current interface

ip address dhcp                                -set router to act as DHCP client for interface IP and default gateway information

[no] ip access-group {number | name} {in | out}                -enable or disable access lists

clock rate rate-in-bps                            -set the speed at which router provides a clocking signal, applicable when DCE 
  cable installed

bandwidth rate-in-bps                            -set the speed at which the router considers the interface to operate, does not
 control actual speed. Used by some routing protocols to calculate metrics

    standby version 1 | 2                            -set the HSRP version for all groups on the interface

standby group-number ip virtual-ip                    -define a virtual IP address and associate it with an HSRP group

    standby group-number priority 0...255                    -set interface priority in specified HSRP group

    [no] standby group-number preempt                    -enable or disable preemption for the interface in specified HSRP group

    standby group-number name descriptive-name                -define a descriptive name for specified HSRP group


Subinterfaces Submode

interface subint-id                            -create subinterface and enter configuration mode for that interface

encapsulation dot1q vlan-id [native]                    -set the router to use 802.1Q trunking for specified VLAN on the current
 subinterface.  native tells the router not to encapsulate in a trunking header

encapsulation isl vlan-identifier                        -set the router to use isl trunking for a particular VLAN


RIP Submode

    router rip                                -enter RIP configuration mode

    version 2                                -set RIP version

    network network-address                        -enable RIP on all interfaces in specified classful network

    passive-interface default                        -changes the default setting on RIP-enabled interfaces to passive

    [no] passive-interface                            -set RIP to no longer advertise RIP updates on the listed interface, no overrides
 the default passive setting for the interface

    [no] auto-summary                            -disable or enable autosummarization

    maximum-paths    number                            -set the maximum number of equal-metric routes for the same subnet that RIP
 will add to the routing table

    default-information originate                        -cause RIP to advertise the default route (0.0.0.0 0.0.0.0) if the local router has a
 default route in itis routing table already


DHCP Pool Submode
    
    ip dhcp pool pool-name                            -creates a pool and moves user t DHCP server pool configuration mode

    network subnet-id {ddn-mask | /prefix-length}                -defines a network or subnet causing the DHCP server to lease out IP addresses
 in that subnet

    default router address 1 address2…                    -defines one or more routers as default routers, with that information passed to
 clients served by this pool

    dns-server address1 address2…                    -defines one or more DNS servers that the DHCP server will list for clients served
 by this pool

    lease {days | [hours[minutes]] | infinite}                    -define the length of time for a DCHP lease for clients served by this pool

    ip helper-address ip-address                        -tells the router to notice local subnet broadcasts that use UDP and change the
 source and destination IP address, enabling DHCP servers to sit on a remote
 subnet

    domain-name domain-name                        -define the DNS domain name

next-server ip-address                            -define the TFTP server IP used by any hosts that need a TFTP server


ACL Config Submode

    ip access-list {standard | extended} name                -configure a named standard or extended ACL and enter ACL configuration
 mode

    {deny | permit} source [source wildcard] [log]                -configure matching details and action for a standard named ACL

    {deny | permit} protocol source source-wildcard                -configure matching details and action for an extended named ACL
destination destination wildcard [log]

remark text                                -set a description of a named ACL 
    

Console Line Submode

    line console 0                                -change to console line config submode

    login                                    -set IOS to prompt for password at login (no username)

    login local                                -tell IOS to prompt for a username and password

username name secret pass-value                    -define one of possibly multiple usernames and associated passwords

    password pass-value                            -set the password required for login if login command (with no parameters) is
 also configured

    logging synchronous                            -tell IOS to send log messages to console at natural break points rather than the
 middle of a line of output

    [no] logging console                            -disable or enable display of log messages to console

    exec-timeout minutes [seconds]                        -set the inactivity timeout for current user login session

    history size length                            -change the size of the history buffer for users of this line

VTY Line Submode

    line vty 1st-vty last-vty                            -change to vty line config submode for specified range of vty lines

    access-class number | name [in | out]                    -enable standard or extended access lists on vty lines

    transport input {telnet | ssh | all | none}                    - define whether telnet/ssh access is allowed into router


Examples

    Configure Ripv2
(config)# router rip
(config-router)# version 2
(config-router)# network 192.168.1.0
(config-router)# network 192.168.4.0
(config-router)# network 192.168.5.0
    

Router configuration for 801.1Q
    (config)# interface gigabitethernet 0/0/0.10
    (config-subif)# encapsulation dot1q 10
    (config-subif)# ip address 10.1.10.1 255.255.255.0

    (config)# interface gigabitethernet 0/0/0.20
    (config-subif)# encapsulation dot1q 20
    (config-subif)# ip address 10.1.20.1 255.255.255.0

    (config-subif)#interface gigabitethernet 0/0/0
    (config-if)#no shut


    Static Routes
    (config)# ip route 172.16.2.0 255.255.255.0 172.16.4.2
    (config)# ip route 172.16.3.0 255.255.255.0 s0/0/1

    
    DHCP Configuration
    (config)# ip dhcp excluded-address 172.16.1.1 172.16.1.50
    (config)# ip dhcp excluded-address 172.16.2.1 172.16.2.100
     (config)# ip dhcp pool Pool1
    (dhcp-config)# network 172.16.1.0 255.255.255.0
    (dhcp-config)# dns-server 172.16.1.12
    (dhcp-config)# default-router 172.16.1.1
    (dhcp-config)# lease 0 23 59
    (dhcp-config)# domain-name example.com
    (dhcp-config)# next-server 172.16.2.5

    (config)# ip dhcp pool Pool2
    (dhcp-config)# network 172.16.2.0 /24
    (dhcp-config)# dns-server 172.16.1.12
    (dhcp-config)# default-router 172.16.2.1
    (dhcp-config)# lease 1 2 3
    (dhcp-config)# next-server 172.16.2.5
    

Router on a Stick
(config)# interface gigabitethernet 0/0/0
(config-if)# no shutdown
(config-if)# interface gigabitethernet 0/0/0.10
    (config-subif)# encapsulation dot1q 10
    (config-subif)# ip address 192.168.1.1 255.255.255.0

    (config)# interface gigabitethernet 0/0/0.20
    (config-subif)# encapsulation dot1q 20
    (config-subif)# ip address 192.168.2.1 255.255.255.0

    (config)# ip route 192.168.1.0 255.255.255.0 g0/0/0
    (config)# ip route 192.168.2.0 255.255.255.0 g0/0/0
    (config)# ip route 0.0.0.0 0.0.0.0 g0/0/3

    (config)# router rip
    (config-router)# version 2
(config-router)# network 192.168.1.0
(config-router)# network 192.168.2.0
(config-router)# default-information originate
(config-router)# end

Configuring HSRP
    (R1-config)# interface g0/0
    (R1-config-if)# ip address 192.168.0.4 255.255.255.0
    (R1-config-if)# standby version 2
    (R1-config-if)# standby 1 ip 192.168.0.1 
    (R1-config-if)# standby 1 priority 110
(R1-config-if)# standby 1 preempt
(R1-config-if)# no shut

(R2-config)# interface g0/0
(R2-config-if)# standby version 2
(R2-config-if)# standby 1 ip 192.168.0.1
(R2-config-if)# no shut


Standard Numbered ACLs
(config)# access list 1 permit 10.1.1.1
(config)# access list 1 deny 10.1.1.0 .0.0.0.255
(config)# access list 1 permit 10.0.0.0 0.255.255.255

(config)# interface g0/0/0
(config-if)# ip access-group 1 in
(config-if)# end


Extended Numbered ACLs
(config)# interface g0/0/0
(config-if)# ip address 172.16.12.1 255.255.255.0
(config-if)# ip access group 101 in

(config-if)# interface g0/0/1
(config-if)# ip address 172.16.13.1 255.255.255.0
(config-if)# ip access group 101 in

(config-if)# exit
(config)# access list 101 remark Stop Bob to FTP servers, and LArry to Server1 web
(config)# access list 101 deny tcp host 172.16.3.10 172.16.1.0 0.0.0.255 eq ftp
(config)# access list 101 deny tcp host 172.16.2.10 host 172.16.1.100 eq www
(config)# access list 101 permit ip any any


Named ACLs
(config)# ip access-list extended ACL01
(config-ext-nacl)# permit tcp host 10.1.1.2 eq www any
(config-ext-nacl)# deny udp host 10.1.1.1 10.1.2.0 0.0.0.255
(config-ext-nacl)# deny ip 10.1.3.0 0.0.0.255 10.1.2.0 0.0.0.255
(config-ext-nacl)# deny ip 10.1.2.0 0.0.0.255 10.2.3.0 0.0.0.255
(config-ext-nacl)# permit ip any any

(config-ext-nacl)# interface g0/0/0
(config-if)# ip access-group ACL01 out
(config-if)# end

    
Static NAT
    (config)# interface GigabitEthernet0/0
(config-if)# ip address 10.1.1.3 255.255.255.0
     (config-if)# ip nat inside

(config-if)# interface Serial0/0/0
     (config-if)# ip address 200.1.1.251 255.255.255.0
     (config-if)# ip nat outside

(config)# ip nat inside source static 10.1.1.2 200.1.1.2
(config)# ip nat inside source static 10.1.1.1 200.1.1.1

Dynamic NAT
interface GigabitEthernet0/0
ip address 10.1.1.3 255.255.255.0
ip nat inside

interface Serial0/0/0
ip address 200.1.1.251 255.255.255.0
ip nat outside

ip nat pool fred 200.1.1.1 200.1.1.2 netmask 255.255.255.252
ip nat inside source list 1 pool fred [overload]

access-list 1 permit 10.1.1.2
access-list 1 permit 10.1.1.1