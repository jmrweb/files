# DNS

## dnsmap

- Basic
	  
	  sudo dnsmap <target>
	
- Brute Force

	  sudo dnsmap <target> -w <path files>
	  
## dig

- All records:

	  dig <target>  ANY +noall +answer
	
- Other:	

	  dig <target> +short
	
	  dig <target> mx
	
	  dig <target> soa
	
	  dig <target> TTL
	
## nslookup

## Amass
Owasp developed recon and scanning tool
https://owasp.org/www-project-amass/
https://github.com/OWASP/Amass