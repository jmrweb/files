# whois
[[../Tools/whois]]
https://en.wikipedia.org/wiki/WHOIS
https://en.wikipedia.org/wiki/Name_server
https://en.wikipedia.org/wiki/Domain_name_registrar

- Whois is a protocol used for querying databases that resgistration information for internet resources.
- Whois records contain registration info for domain names, IP address blocks and autonomous systems.


## Forward lookup (Domain Names)

	whois $TARGET_DOMAIN -h <whois_server_ip>

- Valuable information may include:
	- Registrant names
	- Email addresses
	- Phone numbers
	- Name servers

## Reverse lookup (IP addresses)

	whois $TARGET_DOMAIN -h <whois_server_ip>

- Provides information about who is hosting the IP address
- Valuable information may include:
	-  IP range and  CIDR of the network

