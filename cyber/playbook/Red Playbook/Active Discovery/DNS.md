# DNS
https://en.wikipedia.org/wiki/Domain_Name_System
https://en.wikipedia.org/wiki/Reverse_DNS_lookup
https://datatracker.ietf.org/doc/html/rfc8020
https://github.com/danielmiessler/SecLists
https://github.com/darkoperator/dnsrecon

## Common record types

- **NS**: Nameserver records contain the name of the authoritative servers hosting the DNS records for a domain.

- **A**: Also known as a host record, the "_a record_" contains the IPv4 address of a hostname (such as www.megacorpone.com).

- **AAAA**: Also known as a quad A host record, the "_aaaa record_" contains the IPv6 address of a hostname (such as www.megacorpone.com).

- **MX**: Mail Exchange records contain the names of the servers responsible for handling email for the domain. A domain can contain multiple MX records.

- **PTR**: Pointer Records are used in reverse lookup zones and can find the records associated with an IP address.

- **CNAME**: Canonical Name Records are used to create aliases for other host records.

- **TXT**: Text records can contain any arbitrary data and be used for various purposes, such as domain ownership verification.


## Subdomain Wordlists
https://github.com/danielmiessler/SecLists

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
- `-t std` standard scan
- `-t brt` brute force

Basic:

	dnsrecon -d <target_domain> -t std

Brute Force Subdomains:

	dnsrecon -d <target_domain> -D <subdomain_file> -t brt

--------------------------------------------------------------------------

## dnsenum

Basic:

	dnsenum <target_domain>

--------------------------------------------------------------------------

## dnsmap

Basic:

	sudo dnsmap <target_domain>
	
Brute Force Subdomains:

	sudo dnsmap <target_domain> -w <path files>

--------------------------------------------------------------------------

## dig

All records:

	dig <target_domain>  ANY +noall +answer
	
Other:	

	dig <target_domain> +short
	
	dig <target_domain> mx
	
	dig <target_domain> soa
	
	dig <target_domain> TTL

--------------------------------------------------------------------------

## nslookup (Windows)

Basic:

	nslookup <target_domain>

Specifiy record type:

	nslookup -type=TXT <taget_domain>

Specify DNS server:

	nslookup -type=TXT <taget_domain> <dns_server_ip>
	
--------------------------------------------------------------------------

## Amass

Owasp developed recon and scanning tool
https://owasp.org/www-project-amass/
https://github.com/OWASP/Amass