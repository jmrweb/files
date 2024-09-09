# Domain Name Service (DNS)

Ports: 53 UDP/TCP

----------------------------------------------------------------------------------------

[List of DNS Record Types](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
[DNS Hacking](http://resources.infosecinstitute.com/dns-hacking/#gref)

https://en.wikipedia.org/wiki/Domain_Name_System
https://en.wikipedia.org/wiki/Reverse_DNS_lookup
https://datatracker.ietf.org/doc/html/rfc8020
https://github.com/danielmiessler/SecLists
https://github.com/darkoperator/dnsrecon

--------------------------------------------------------------------------

## Playbook

- ### nmap discovery scan (safe)

      sudo nmap -p 53 --script="(safe and not vuln) and (dns* or broadcast-dns-service-discovery.nse or fcrdns.nse)" --script-args newtargets $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_53_discovery_safe

- ### nmap vuln scan (safe)

      sudo nmap -p 53 --script="vuln and safe and (vulners or dns*)" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_53_vuln_safe

- ### nmap discovery scan (intrusive)

      sudo nmap -p 53 --script="(discovery and auth and broadcast and intrusive) and dns*" --script-args newtargets $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_53_discovery_intrusive

- ### nmap vuln scan (intrusive)

      sudo nmap -p 53 --script="vuln and intrusive and dns*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_53_vuln_intrusive

- ### dig scan

      dig $TARGET_DOMAIN ANY +noall +answer

- ### dnsrecon scan	
	
      dnsrecon -d $TARGET_DOMAIN -t std

- ### dnsenum scan

      dnsenum $TARGET_DOMAIN

- ### dnsmap scan

      sudo dnsmap $TARGET_DOMAIN

- ### Brute Force Subdomains

      sudo nmap -p 53 --script="brute and dns*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_53_brute

  or

      dnsrecon -d $TARGET_DOMAIN -D $SUBDOMAIN_WORDLIST -t brt

  or

      sudo dnsmap $TARGET_DOMAIN -w $SUBDOMAIN_WORDLIST
      
--------------------------------------------------------------------------

## Subdomain Wordlists
https://github.com/danielmiessler/SecLists
	
--------------------------------------------------------------------------

## Common record types

- **NS**: Nameserver records contain the name of the authoritative servers hosting the DNS records for a domain.

- **A**: Also known as a host record, the "_a record_" contains the IPv4 address of a hostname (such as www.megacorpone.com).

- **AAAA**: Also known as a quad A host record, the "_aaaa record_" contains the IPv6 address of a hostname (such as www.megacorpone.com).

- **MX**: Mail Exchange records contain the names of the servers responsible for handling email for the domain. A domain can contain multiple MX records.

- **PTR**: Pointer Records are used in reverse lookup zones and can find the records associated with an IP address.

- **CNAME**: Canonical Name Records are used to create aliases for other host records.

- **TXT**: Text records can contain any arbitrary data and be used for various purposes, such as domain ownership verification.

--------------------------------------------------------------------------

## host

Query A records:

	host <target_host>

Specify record type with `-t`:

	host -t mx <target_host>

Brute force subdomains:

	for subdomain in $(cat list.txt); do host $subdomain.<target_host>; done

Brute force ip range:

- Scan for ips in range 51.222.169.200 to 51.222.169.254 and show only entries that do not contain "not found"

		for octet in $(seq 200 254); do host 51.222.169.$octet; done | grep -v "not found"

--------------------------------------------------------------------------

## dnsrecon

Options:

`-d` domain
`-D` file containing subdomain list
`-t` type of scan
- `std` standard scan
- `brt` brute force

Basic:

	dnsrecon -d $TARGET_DOMAIN -t std

Brute Force Subdomains:

	dnsrecon -d $TARGET_DOMAIN -D <subdomain_file> -t brt

--------------------------------------------------------------------------

## dnsenum

Basic:	sudo dnsmap $TARGET_DOMAIN

	dnsenum $TARGET_DOMAIN

--------------------------------------------------------------------------

## dnsmap

Basic:

	sudo dnsmap $TARGET_DOMAIN
	
Brute Force Subdomains:

	sudo dnsmap $TARGET_DOMAIN -w <path files>

--------------------------------------------------------------------------

## dig

All records:

	dig $TARGET_DOMAIN  ANY +noall +answer
	
Other:	

	dig $TARGET_DOMAIN +short
	
	dig $TARGET_DOMAIN mx
	
	dig $TARGET_DOMAIN soa
	
	dig $TARGET_DOMAIN TTL

--------------------------------------------------------------------------

## nslookup (Windows)

Basic:

	nslookup $TARGET_DOMAIN

Specifiy record type:

	nslookup -type=TXT <taget_domain>

Specify DNS server:

	nslookup -type=TXT <taget_domain> <dns_server_ip>
	
--------------------------------------------------------------------------

## Amass

Owasp developed recon and scanning tool
https://owasp.org/www-project-amass/
https://github.com/OWASP/Amass