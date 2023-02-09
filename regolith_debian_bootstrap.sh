#!/bin/bash

#install ansible
sudo apt install -y ansible

# Register the Regolith public key to your local apt
wget -qO - https://regolith-desktop.org/regolith.key | gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

# Add the Regolith repository URL to your local apt
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] https://regolith-desktop.org/release-debian-bullseye-amd64 bullseye main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

# Update apt
sudo apt update
sudo apt install regolith-desktop regolith-compositor-picom-glx

# Download and run bootstrap script
mkdir /tmp/bootstrap
wget https://github.com/jmrweb/files/tarball/master -O /tmp/regolith_debian_bootstrap.tgz
tar xzvf /tmp/regolith_debian_bootstrap.tgz --strip-components=1 -C /tmp/bootstrap
ansible-playbook /tmp/bootstrap/ansible/regolith_debian_setup.yaml -K
