# Logs

## Logs of forensic interest

- ### Apache

	  /var/log/apache/error.log
	 - diagnostic information and errors for apache web server

	  /var/log/apache/access.log
	 - record of HTTP requests
        
- ### Authentication

	  /var/log/auth.log
	 - record of authentication attempts
	
	  /var/log/wtmp.log
	 - login/logout/reboot information
	 - stored in binary
	 - use ‘last’ command to view

	  /var/log/lastlog.log
	 - record of last time each user logged in
	 - stored in binary
	 - use ‘last’ command to view
        
## Other important Linux logs

- ### System Logs

	  /var/log/messages.log
	 - global system messages (including startup)    
    
	  /var/log/dmesg.log
	 - Kernel Ring Buffer information (hardware boot information)
         
	  /var/log/daemon.log
	 - information about running system and application daemons

- ### Application Logs

	  /var/log/mysqld.log
	 - MySQL server log
    
	  /var/log/samba/log.nmbd, /var/log/samba/log.smbd
	 - Samba file sharing and network logs
        
## Log Analysis
    
- Watch for changes in realtime

	  tail -f <log_file>
    
- Sum all numbers in a field of a text file
	 
	  awk '{s+=$<field>} END {print s}' <file_name>

- Sum values of a column based on values of another column

	  awk '{a[$<index_column>] += <sum_column>} END{for (i in a) print i, a[i]}' <file_name>
    
    
## Tools

- **Security Onion**
  - Linux distribution designed for IDS and NSM
        
- **logstash**
  - Log management/storage
        
- **OSSEC**
  - Agent/manager (client/server) architecture log monitor
     
- **AWStat**
  - Open source analyzer with statistical graphics
        
- **Webalizer**
  - Web server log anaylzer
  - Produces html reports
  - Written in c (very fast)

