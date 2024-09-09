# Getting Started
[Getting started guide](https://docs.ansible.com/ansible/latest/getting_started/index.html)

## Installation
- [Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installation-guide)

## Concepts
https://docs.ansible.com/ansible/latest/getting_started/basic_concepts.html

## 3 Main Components

- ### Control node
	- The ansible server
	
- ### Managed node
	- The a remote host controlled by the ansible server

- ### Inventory
	- A list of managed nodes maintained on the control node
		- logically oragnized
		- describes host deployments

## Inventories
Organzied list of managed nodes
https://docs.ansible.com/ansible/latest/getting_started/get_started_inventory.html

- ### Install control node ssh key on managed nodes
	- recommend creating "ansible" users on both control node and managed nodes
	  
	  or
	  
	- use variable(s) to set ansible username(s)

- ### Create Inventory file

	- Tips
		
		- Group names are case sensitive.
		- Avoid spaces, hyphens, and preceding numbers (use floor_19, not 19th_floor) in group names.
		- Group hosts in your inventory logically according to their What, Where, and When:

		  What
		  - Group hosts according to the topology, for example: db, web, leaf, spine.

		  Where
		  - Group hosts by geographic location, for example: datacenter, region, floor, building.

		  When
		  - Group hosts by stage, for example: development, test, staging, production.

	- #### Use metagroups 
		- Organize multiple groups in inventory in larger groups
	- #### Create variables
		- Variables set values for managed nodes, such as the IP address, FQDN, operating system, and SSH user, so you do not need to pass them when running Ansible commands

## Playbooks
Automation blueprint
https://docs.ansible.com/ansible/latest/getting_started/get_started_playbook.html#get-started-playbook

- ### Structure:
	
	- #### Playbook
		- List of **plays** thats defines the order of operations that will be performed to achieve an overall goal
	
	- #### Play
		- A an ordered list of **tasks** that maps to managed nodes in an inventory
	
	- #### Task
		- A list of one or more **modules** that defines the operations that ansible can perform
	
	- ### Module
		- A unit of code or binary that ansible runs on managed nodes.  
		- Grouped in collections with a Fully Qualified Collection Name (FQCN) for each module.