# Commands

- Must specify path to inventory and playbook files if not in pwd.

## Run playbook
	
	ansible-playbook -i <inventory_file> <playbook_file>
	
## View inventory

	ansible-inventory -i <inventory_file> --list
	
## Run single module against group in inventory

	ansible <group> -m ping -i <inventory_file>