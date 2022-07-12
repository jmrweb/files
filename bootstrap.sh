#!/bin/bash
sudo apt install -y ansible
mkdir /tmp/bootstrap
wget https://github.com/jmrweb/files/tarball/master -O /tmp/bootstrap.tgz
tar xzvf /tmp/bootstrap.tgz --strip-components=1 -C /tmp/bootstrap
ansible-playbook /tmp/bootstrap/ansible/regolith_setup.yaml -K
