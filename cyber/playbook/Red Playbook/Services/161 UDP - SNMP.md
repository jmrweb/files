# Simple Network Management Protocol (SNMP)

Ports: 161 UDP

Community String:

----------------------------------------------------------------------------------------

Default community string: public

Main featrures: 

- SNMP MIB Tree
  https://www.ibm.com/docs/en/aix/7.1?topic=management-information-base

	- Management Information Base (MIB)
		- database containing information usually related to network management
			- Organized in a tree
				- branches represent different organizations or network functions
				- leaves correspond to specific variable values that can then be accessed and probed by an external user
	- OID branch
	   https://en.wikipedia.org/wiki/Object_identifier
		- OID: Object identifier
			- globally unambiguous persistent name
		- 
- Community string
	- SNMP "password"
	- Default community string: public 

--------------------------------------------------------------------------

## Playbook

- ### nmap discovery scan (safe)

      sudo nmap -sU -p 161 --script="(safe and not vuln) and snmp*" --script-args newtargets "$WORKING_DIRECTORY""$TARGET_IP"_nmap_161_discovery_safe

- ### nmap vuln scan (safe)

      sudo nmap -sU -p 161 --script="vuln and safe and (vulners or snmp*)" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_161_vuln_safe

- ### Scan for additional targets: (should be redundant)
- can be used to identify and automatically add new targets to the scan by supplying the newtargets script argument

      sudo nmap -sU -p 161 --script=snmp-netstat --script-args newtargets $TARGET_IP

- ### nmap script scans (should be redundant)

      sudo nmap -sU -p 161 --script=snmp-info,snmp-sysdescr,snmp-processes,snmp-interfaces,snmp-ios-config,snmp-hh3c-logins,snmp-win32-services,snmp-win32-shares,snmp-win32-software,snmp-win32-users  $TARGET_IP 

- ### nmap discovery scan (intrusive)

      sudo nmap -sU -p 161 --script="(discovery and auth and broadcast and intrusive) and snmp*" --script-args newtargets $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_161_discovery_intrusive

- ### nmap vuln scan (intrusive)

      sudo nmap -sU -p 161 --script="vuln and intrusive and snmp*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_161_vuln_intrusive

- ### nmap brute force

      sudo nmap -sU -p 161 --script="brute and snmp*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"nmap_161_brute

- ### Brute force community string

      onesixtyone -c $COMMUNITYSTRING_WORDLIST -i $TARGET_IP

- ### Examine MIB with SNMP walk

  see notes below

--------------------------------------------------------------------------

## onesixtyone
http://www.phreedom.org/software/onesixtyone/

SNMP scanner.

Brute force community strings:

	onesixtyone -c $WORDLIST -i <iplist_file_or_env_variable>

--------------------------------------------------------------------------

## snmpwalk
https://linux.die.net/man/1/snmpwalk

Enumerate entire MIB tree:

	snmpwalk -c <coomunity_string> -v1 -t 10 <target_address>

Query specific values in the OID branch of the MIB tree.

	snmpwalk -c <community_string> -v1 <target_address> <MIB value>

MIB values of interest:

|MIB value|SNMP parameter|
|---|---|
|1.3.6.1.2.1.2.2.1.2|Interfaces|

Windows MIB values of interest:

|MIB value|SNMP parameter|
|---|---|
|1.3.6.1.2.1.25.1.6.0|System Processes|
|1.3.6.1.2.1.25.4.2.1.2|Running Programs|
|1.3.6.1.2.1.25.4.2.1.4|Processes Path|
|1.3.6.1.2.1.25.2.3.1.4|Storage Units|
|1.3.6.1.2.1.25.6.3.1.2|Software Name|
|1.3.6.1.4.1.77.1.2.25|**User Accounts**|
|1.3.6.1.2.1.6.13.1.3|TCP Local Ports|

--------------------------------------------------------------------------