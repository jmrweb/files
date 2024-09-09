# **Cisco Switch CLI** #

## **EXEC Mode** #

|command                            		   | description                          								 		|
|--------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| enable                            		   | move to enable (privileged) mode     								 		|
| disable                           		   | move from enable mode to user mode   								 		|
| quit                              		   | disconnect user from CLI session     								 		|
| reload                            		   | reboot switch					    								|
| copy running-config startup-config		   | running-config to startup-config     								 		|
| write erase                       		   | erase startup-config file            								 		|
| erase startup-config				   | ""								    							|
| erase nvram:                      		   | ???								    						|
| no debug all                                     | disable all currently enabled debugs                                						|
| undebug all					   | ""									                                 		|
| terminal history size *x*			   | change the length of the history buffer for current user session    						|
| enable secret *pass-value*                       | set password for enable mode										 	|
|						   |															|
|						   |															|
| show startup-config                              | lists the contents of startup-config										|
| show running-config               		   | lists the currently used configuration										|
| show running-config \| interface *type* *number* | list running-configuration excerpt for specified interface								|
| show running-config \| begin *line vty*          | list output beginning with the first line that contains “line vty”							|
| show dhcp lease                           	   | lists any information the switch acquires as a dhcp client								|
| show crypto key mypubkey rsa                     | lists the public and shared key created for use with SSH								|
| show history                              	   | lists the commands in the current history buffer									|
| show ssh                              	   | lists status information for current ssh connections								|
| show ip ssh                                      | lists status information for the SSH server									|
| show ip default-gateway                          | lists the switches setting for its IPv4 default gateway 								|
| show interfaces [*interface-id*]                 | list information about all interfaces or specified interface							|
| show interfaces [*interface-id*] status          | list one output line per interface showing description, operating state, duplex, and speed 		     	|
| show interfaces [*interface-id*] switchport	   | list information about specified interface regarding administrative settings and operational state 	     	|
| show interfaces [*interface-id*] trunk           | list information about all operational trunks, including the list of VLANs that can be forwarded over the trunk 	|
| show interfaces vlan number                      | lists the interface status, the switch’s IPv4 address and mask, and much more 				     	|

show vlan [vlan]                                -display VLAN information

show vlan [brief | id vlan-id | name vlan-name | summary]        -list information about the VLAN

show vtp status                                -list VLAN Trunking Protocol (VTP)  configuration and status info

show vtp password                            -list current vtp password on the local switch

show mac address-table                        -show all MAC table entries of all type

show mac address-table dynamic [interface interface-id]            -list the dynamically learned entries in the switch’s MAC address table

show mac address-table static [interface interface-id]            -list static MAC addresses and MAC addresses learned or defined with port
 security

    show mac address-table secure [interface interface-id]            -list MAC addresses defined or learned on ports configured with port security

show mac address-table dynamic vlan vlan-id                -show all dynamically learned MAC table entries in that VLAN

show mac address-table dynamic address MAC-address            -show the dynamically learned MAC table entries with that MAC address

show port-security                            -list one line per interface summarizing port security settings

show port-security [interface interface-id] [address]            -list interface port security settings and security operational status

show ip arp                                -show arp table

show spanning-tree                            -list details about state of STP on the switch, including the state of each port

show spanning-tree interface interface-id [portfast]            -list STP information only for the specified interface

show spanning-tree vlan vlan-id                        - list STP information for the specified VLAN

show spanning-tree [vlan vlan-id] root                    -lists information about each VLAN’s root or the specified VLAN

show spanning-tree [vlan vlan-id] bridge                    -lists STP information about the local switch for each VLAN or the specified
 VLAN

show spanning-tree summary                        -lists global STP settings for a switch, including the default PortFast and BPDU
 Guard settings, and the VLANs for which this switch is the root

    show etherchannel [channel-group-number]                -list state of etherchannels on the switch
{brief | detail | port | port-channel | summary}

Global Configuration Mode

configure terminal                            -move user from exec mode to configuration mode

hostname name                                -set hostname for switch

exit                                    -move back to higher config mode

end                                    -move back to enable mode from any config submode

ctrl+z                                    -same as end command

enable secret pass-value                        -set password for enable mode

crypto key generate rsa [modulus 360...2048]                -create and stores the keys required by SSH

[no] shutdown vlan vlan-id                        -disable or enable specified VLAN on the local switch

vtp domain domain-name                        -define the vtp domain name

[no] vtp mode {server | client | transparent | off}                -define the VLAN Trunking Protocol (VTP) mode

[no] vtp password [password]                        -define the VTP password

vtp version {1 | 2}                            -set the VTP version

[no] vtp pruning                                -set the VTP server to tell all switches to use VTP pruning

spanning-tree mode {pvst | rapid-pvst | mst}                -set STP mode

spanning-tree [vlan vlan-number] root primary                -change this switch to the root switch, priority is changed to the lower of
 either 24,576 or 4096 less than priority of current root bridge

    spanning-tree [vlan vlan-number] root secondary                -set switch’s base priority to 28,672

    spanning-tree [vlan vlan-number] priority priority                -set bridge priority for specified VLAN

    [no] spanning-tree portfast default                    -set switch default for PortFast on access interfaces to disabled or
 enabled

    [no] spanning-tree portfast bpduguard default                -set switch default for BPDU Guard on access interfaces to disabled
 or enabled

Interface Submode

    interface type port-number                        -change to interface config submode

    interface range type port-number end-port-number            -change to interface config submode for a range of interfaces

    [no] shutdown                                -disable or enable current interface(s)

    [no] speed {10 | 100 | 1000 | auto}                    -manually set speed of current interface(s), no reverts to default
    
    [no] duplex {auto | full | half}                        -manually set duplex setting of current interface(s), no reverts to default

    [no] description text                            -set informational text for interface, no reverts to none

    switchport mode {access | dynamic {auto | desirable} | trunk}        -set trunking administrative mode on the interface

    switchport access vlan vlan-id                        -statically configure the interface into the specified VLAN

    switchport trunk encapsulation {dot1q | isl | negotiate}            -define which type of trunk to use, assumes trunking is configured on the
 interface

    switchport trunk native vlan vlan-id                    -define the native vlan for a trunk interface

    switchport trunk allowed vlan {add | all | except | remove} vlan-list        -define the list of allowed VLANs

    switchport nonegotiate                            -disables negotiation of VLAN trunking

    switchport voice vlan vlan-id                        -defines the voice VLAN on an interface, meaning the switch uses 801.1Q
 tagging for frames in the VLAN

    switchport port-security mac-address mac-address            -statically add a specific MAC address as an allowed MAC address on the
 interface

    switchport port-security mac-address sticky                -tell switch to learn MAC addresses on the interface and add them as allowed
 MAC addresses

    switchport port-security maximum value                    -set maximum number of static secure MAC addresses that can be assigned to a
 single interface

    switchport port-security violation {protect | restrict | shutdown}        -tell switch what to do if an inappropriate MAC address tries to access the
 network through a secure switch port

    spanning-tree [vlan vlan-number] cost cost                -set STP cost to specified value

    spanning-tree [vlan vlan-number] port-priority priority            -set STP port priority (0 to 240 in increments of 16)

    spanning-tree portfast [disable]                        -enable/disable portfast on the interface

    spanning-tree portfast bpduguard [enable | disable]            -enable/disable BPDU Guard on the interface

    channel-group channel-group-number mode                -enable EtherChannel on the interface
{auto | desirable | active | passive | on} 
     
Interface VLAN Submode

    interface vlan number                            -change to interface vlan submode

    ip address dhcp                                -configure virtual interface as DHCP client

    ip address ip-address subnet-mask                    -statically configure virtual interface IP address and mask

    ip default-gateway address                        -manually configure virtual interface IPv4 default gateway

    ip name-server server-ip-1 server-ip-2                    -manually configure virtual interface DNS servers

VLAN Submode

vlan vlan-id                                -creates specified VLAN and changes to VLAN config submode

name vlan-name                            -name the current VLAN

[no] shutdown                                -disable or enable current VLAN
 
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

Port-Channel Submode

    int port-channel [port-channel number]                    -change to interface port-channel submode

VTY Line Submode

line vty 1st-vty last-vty                            -change to vty line config submode for specified range of vty lines

login                                    -set IOS to prompt for password at login (no username)

login local                                -tell IOS to prompt for a username and password

username name secret pass-value                    -define one of possibly multiple usernames and associated passwords

    password pass-value                            -set the password required for login if login command (with no parameters) is
 also configured

    logging synchronous                            -tell IOS to send log messages to console at natural break points rather than the
 middle of a line of output

    [no] logging console                            -disable or enable display of log messages to console

    exec-timeout minutes [seconds]                        -set the inactivity timeout for current user login session

    transport input {telnet | ssh | all | none}                    -define whether telnet/ssh access is allowed into switch
    
history size length                            -change the size of the history buffer for users of currently specified lines


    
Examples

    Configuring basic passwords:
    (config)# enable secret Password01
    
    (config)# line console 0
    (config-line)# password Password02
    (config-line)# login
    (config-line)# exit

    (config)# line vty 0 15
    (config-line)# password Password03
    (config-line)# login
    (config-line)# end


    SSH configuration process:
    (config)# hostname SW1
    (config)# ip domain-name example.com
    (config)# crypto key generate rsa modulus 1024
    (config)# ip ssh version 2
    
(config)# line vty 0 4
    (config-line)# login local
    (config-line)# transport input ssh
    (config-line)# exit
    
(config)# line vty 5 15
    (config-line)# transport input none
(config-line)# exit
    
(config)# username wendell password odom
    (config)# username chris password youdaman
    (confg)# end


    Static IP configuration
    (config)# interface vlan 1
    (config-if)# ip address 192.168.1.200 255.255.255.0
    (config-if)# no shutdown
    (config-if)# exit
    (config)# ip default-gateway 192.168.1.1
    (config)# end


    Switch Dynamic IP configuration with DHCP
    (config)# interface vlan 1
    (config-if)# ip address dhcp
    (config-if)# no shutdown
    (config-if)# end
    

    Verify DHCP-learned information
# show DHCP lease
    # show interfaces vlan number
    # show ip default-gateway

    Port-Security
    (config)# interface FastEthernet0/1
    (config-if)# switchport mode access
    (config-if)# switchport port-security
(config-if)# switchport port-security mac-address 0200.1111.1111
 
(config)# interface FastEthernet0/2
    (config-if)# switchport mode access
    (config-if)# switchport port-security
(config-if)# switchport port-security mac-address sticky

(config)# interface FastEthernet0/3
    (config-if)# switchport mode access
    (config-if)# switchport port-security

(config)# interface FastEthernet0/4
    (config-if)# switchport mode trunk
    (config-if)# switchport port-security maximum 8
    

Configuring VLANs
    (config)# vlan 2
    (config-vlan)# name Freds-vlan
    (config)# interface range fastethernet 0/13 - 14
    (config-if)# switchport access vlan 2
    (config-if)# switchport mode access


Configuring Voice and Data VLANs
    (config)# vlan 10
    (config-vlan)# vlan 11
    (config)# interface range fastethernet 0/1 - 4
    (config-if)# switchport mode access
    (config-if)# switchport access vlan 10
    (config-if)# switchport voice vlan 11


    Configuring VTP
    (sw1-config)# vtp mode server
    (sw1-config)# vtp domain domain01
    (sw1-config)# vtp password password01
    (sw1-config)# vtp pruning
    (sw1-config)# vtp version 2

    (sw2-config)# vtp mode client
    (sw2-config)# vtp domain domain01
    (sw2-config)# vtp password password01
    (sw2-config)# vtp version 2


Configuring Trunking
    (config-if)# interface fastethernet 0/24
    (config-if)# switchport trunk encap dot1q
(config-if)# switchport mode trunk
    (config-if)# end

    or

    (sw1-config)# interface gigabit 0/1
    (sw1-config-if)# switchport mode dynamic auto
    
    (sw2-config)# interface gigabit 0/1
    (sw2-config-if)# switchport mode dynamic desirable


    Configuring Etherchannel
    (config)# interface port-channel 1
    (config-if)# sw trunk encap dot1q
(config-if)# switchport mode trunk
(config-if)# switchport trunk allow vlan 20
(config-if)# no shut
(config-if)# int fa0/23
(config-if)# channel-group 1 mode on
(config-if)# int fa0/24
(config-if)# channel-group 1 mode on
    (config-if)# end

    Configuring STP priority
    (sw1-config)# spanning-tree vlan 30 priority 4096

    (sw2-config)# spanning-tree vlan 30 priority 8192



Layer 3 Switch Commands

Config Mode

    [no] switchport                                -change port mode between switch port and router port

    [no] ip routing                                -disable or enable routing of IPv4 packets on a Layer 3 switch

sdm prefer lanbase-routing                        -enable the switch to support IP routing if configured
