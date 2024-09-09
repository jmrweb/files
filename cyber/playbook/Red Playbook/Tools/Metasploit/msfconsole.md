# Msfconsole
https://pentestmag.com/metasploit-cheat-sheet/
https://github.com/security-cheatsheet/metasploit-cheat-sheet


## initialize

	sudo service postgresql start
	sudo msfdb init
	msfconsole
	
	or 
	
	sudo msfdb start
	sudo msfdb init
	msfconsole

	
## workspaces

- List workspaces

	  workspace

- Create workspace

      workspace -a <workspace_name>
	  
- Set workspace

      workspace <workspace_name>

## sessions

- List sessions

      sessions

- Open session

      session <sessions_id>

- Upgrade shell to meterpreter

      sessions -u <session_id>
