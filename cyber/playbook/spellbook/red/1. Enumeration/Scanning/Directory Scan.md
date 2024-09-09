# Directory Scan

## Enumerate Subdomains

- AssetFinder + httprobe ?

	  assetfinder <target_domain> > <output_file>
	  cat <output_file> | httprobe > <output_file2>
	  

## Enumerate vhosts
https://erev0s.com/blog/gobuster-directory-dns-and-virtual-hosts-bruteforcing/

- Gobuster

	  gobuster vhost -u <target_address> -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt

- ffuf

	  ffuf -w ~/wordlists/subdomains.txt -H "Host: FUZZ.<target_domain>" -u http://<target_domain>
	
## Enumerate directories

- Gobuster
  
	  gobuster dir -x txt,html,php -u <target_address> -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt --exclude-length 0 -o dirscan 

  - Excluding status codes
    https://infinitelogins.com/2020/09/05/dealing-gobuster-wildcard-and-status-code-errors/

	`-b <code>`
  
- ffuf
	
	  ffuf -u http://192.168.191.76:8000/FUZZ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -fs 0,4708

- dirsearch

	  dirsearch http://localhost:3000 -e http,php,html,txt
