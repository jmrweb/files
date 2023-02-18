#!/bin/bash

# Update apt
sudo apt update

#install ansible
sudo apt install -y ansible

# Download and run bootstrap script
mkdir /tmp/bootstrap
wget https://github.com/jmrweb/files/tarball/master -O /tmp/popos_bootstrap.tgz
tar xzvf /tmp/popos_bootstrap.tgz --strip-components=1 -C /tmp/bootstrap
ansible-playbook /tmp/bootstrap/ansible/popos_setup.yaml -K
