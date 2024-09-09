Cisco Layer 3 Switch CLI

EXEC Mode

enable                                    -move to enable (privileged) mode

disable                                    -move from enable mode to user mode

quit                                    -disconnect user from CLI session

copy running-config startup-config                    -running-config to startup-config

show standby [brief]                            -list details about HSRP status

Global Config Mode

    configure terminal                            -move user from exec mode to configuration mode

hostname name                                -set hostname for switch

exit                                    -move back to higher config mode

end                                    -move back to enable mode from any config submode

ctrl+z                                    -same as end command

enable secret pass-value                        -set password for enable mode

    [no] switchport                                -change port mode between switch port and router port

    [no] ip routing                                -disable or enable routing of IPv4 packets on a Layer 3 switch

sdm prefer lanbase-routing                        -enable the switch to support IP routing if configured

[no] shutdown vlan vlan-id                        -disable or enable specified VLAN on the local switch

vtp domain domain-name                        -define the vtp domain name

[no] vtp mode {server | client | transparent | off}                -define the VLAN Trunking Protocol (VTP) mode

[no] vtp password [password]                        -define the VTP password

vtp version {1 | 2}                            -set the VTP version

[no] vtp pruning                                -set the VTP server to tell all switches to use VTP pruning

Interface Submode

    standby version 1 | 2                            -set the HSRP version for all groups on the interface

standby group-number ip virtual-ip                    -define a virtual IP address and associate it with an HSRP group

    standby group-number priority 0...255                    -set interface priority in specified HSRP group

    [no] standby group-number preempt                    -enable or disable preemption for the interface in specified HSRP group

    standby group-number name descriptive-name                -define a descriptive name for specified HSRP group

Interface VLAN Submode

    interface vlan number                            -change to interface vlan submode

    ip address dhcp                                -configure switch as DHCP client

    ip address ip-address subnet-mask                    -statically configure virtual interface IP address and mask

    ip default-gateway address                        -manually configure virtual interface IPv4 default gateway

    ip name-server server-ip-1 server-ip-2                    -manually configure virtual interface DNS servers

    
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
    
    

Examples

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

    Configure SVIs (layer 3 vlan)
    (config)# interface vlan 99
    (config-if)# ip address 192.168.99.1 255.255.255.0
    (config-if)# no shut

    Configuring HSRP
    (sw1-config)# interface g0/0
    (sw1-config-if)# ip address 192.168.0.4 255.255.255.0
    (sw1-config-if)# standby version 2
    (sw1-config-if)# standby 1 ip 192.168.0.1 
    (sw1-config-if)# standby 1 priority 110
(sw1-config-if)# standby 1 preempt
(sw1-config-if)# no shut

(sw2-config)# interface g0/0
(sw2-config-if)# standby version 2
(sw2-config-if)# standby 1 ip 192.168.0.1
(sw2-config-if)# no shut