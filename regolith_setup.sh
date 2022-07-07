#!/bin/bash

## configure repositories and keys

echo "=========================================================================================================================="
echo "==================================================Configure Repositories=================================================="
echo "=========================================================================================================================="

echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- -P ~/Downloads/ | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- -P ~/Downloads/ | sudo apt-key add -
rm ~/Downloads/oracle*


## update and upgrade system 

echo "=========================================================================================================================="
echo "====================================================Update and Upgrade===================================================="
echo "=========================================================================================================================="

sudo apt -y update && sudo apt -y upgrade


## install basic packages

echo "=========================================================================================================================="
echo "==================================================Install Basic Packages=================================================="
echo "=========================================================================================================================="

declare -a packages=(
        "ansible"				# ansible - Configuration management, deployment, and task execution system
        "curl"					# command line tool for transferring data with URL syntax
        "flameshot"				# Powerful yet simple-to-use screenshot software
        "gimp"					# GNU Image Manipulation Program
        "git"					# git - fast, scalable, distributed revision control system
        "i3xrocks-battery"			# battery monitor for i3bar
        "i3xrocks-focused-window-name"	# show focused window name in i3bar
        "i3xrocks-rofication"			# system notications monitor for i3bar
        "libreoffice"				# libreoffice - office productivity suite
        "locate"				# locate - maintain and query an index of a directory tree
        "neofetch"				# Shows Linux System Information with Distribution Logo
        "python3"				# interactive high-level object-oriented language (default python3 version)
        "python3-pip"				# Python package installer
        "terminator"				# multiple GNOME terminals in one window
        "tlp"					# Save battery power on laptops
        "tree"					# tree - displays an indented directory tree, in color
        "virtualbox"				# virtualbox - x86 virtualization solution - base binaries
        "wireguard"				# wireguard - fast, modern, secure kernel VPN tunnel (metapackage)
)

for str in ${packages[@]}
do
        if dpkg -l $str >/dev/null; then
                echo "$str already installed."
        else i
                sudo apt -y install $str
        fi
done


## install additional applications

echo "=========================================================================================================================="
echo "=================================================Additional Applications=================================================="
echo "=========================================================================================================================="

# btop						https://github.com/aristocratos/btop
mkdir /tmp/btop/
wget -qO btop.tbz https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz -P /tmp/btop
cd /tmp/btop/
sudo tar xf btop.tbz
./install.sh
cd ~
rm -rf /tmp/btop/

# cheat					# an interactive cheat-sheet application
#						https://github.com/cheat/cheat
if test -f "/usr/local/bin/cheat"; then
	echo "cheat already installed."
else
	sudo wget https://github.com/cheat/cheat/releases/download/4.2.3/cheat-linux-amd64.gz -P /usr/local/bin
	sudo gunzip /usr/local/bin/cheat-linux-amd64.gz
	sudo mv /usr/local/bin/cheat-linux-amd64 /usr/local/bin/cheat
	sudo chmod 755 /usr/local/bin/cheat
fi

# discord
curl -L -o "./discord.deb" "https://discord.com/api/download?platform=linux&format=deb"
sudo apt -y install ./discord.deb
rm discord.deb

# jetbrains mono
#cd /usr/share/
#sudo wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
#unzip JetBrainsMono-2.242.zip
#sudo rm -rf /usr/share/fonts/variable
#sudo rm -rf /usr/share/fonts/webfonts
#fc-cache -f -v
#sudo rm JetBrainsMono-2.242.zip
#
#gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono Medium 12'

# joplin
# curl -L -O https://github.com/laurent22/joplin/releases/download/v2.7.15/Joplin-2.7.15.AppImage
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# KVM for remote VM management
#apt -y install qemu-kvm libvirt-daemon-system libvirt-daemon virtinst bridge-utils libosinfo-bin
#
#echo "
#network:
#  ethernets:
#    enp1s0:
#      dhcp4: false
#      # disable existing configuration for ethernet
#      #addresses: [10.0.0.30/24]
#      #routes:
#      #  - to: default
#      #    via: 10.0.0.1
#      #    metric: 100
#      #nameservers:
#      #  addresses: [10.0.0.10]
#      dhcp6: false
#  # add configuration for bridge interface
#  # [macaddress] ⇒ specify HW address of enp1s0
#  bridges:
#    br0:
#      interfaces: [enp1s0]
#      dhcp4: false
#      addresses: [10.0.0.30/24]
#      macaddress: 52:54:00:14:e6:76
#      routes:
#        - to: default
#          via: 10.0.0.1
#          metric: 100
#      nameservers:
#        addresses: [10.0.0.10]
#      parameters:
#        stp: false
#      dhcp6: false
#  version: 2"
#>> /etc/netplan/01-netcfg.yaml
#
#netplan apply
#rm /etc/netplan/01-netcfg.yaml
#
#sudo systemctl enable --now libvert


## download config files

echo "=========================================================================================================================="
echo "==================================================Download Config Files==================================================="
echo "=========================================================================================================================="

mv ~/.bashrc ~/.bashrc_old
wget https://raw.githubusercontent.com/jmrweb/files/main/configs/.bashrc -P ~/
wget https://raw.githubusercontent.com/jmrweb/files/main/configs/.welcome -P ~/

# mathew hedley vim rc				
mv ~/.vimrc ~/.vimrc_old
wget https://xn0.org/.vimrc
wget https://xn0.org/.tmux.conf

mkdir ~/.vim/colors
wget http://xn0.org/mmh.vim -P ~/.vim/colors


#joplin
wget https://raw.githubusercontent.com/jmrweb/files/main/joplin/userstyle.css -P ~/.config/joplin-desktop/
wget https://raw.githubusercontent.com/jmrweb/files/main/joplin/userchrome.css -P ~/.config/joplin-desktop/


## post script

# setup CPU Power Manager

# setup pycharm				https://www.jetbrains.com/pycharm/
# 	confirm latest download file then run:
# 	wget https://download.jetbrains.com/python/pycharm-community-2022.1.1.tar.gz
# 	sudo tar xzf pycharm-*.tar.gz -C /opt/
#
#	add to path:
#	echo "# Path additions" >> .bashrc
#	echo "export PATH=/opt/pycharm-community-2022.1.1/bin/:$PATH" >> .bashrc

# setup jetbrains mono in pycharm:
# 	Preferences/Settings → Editor → Font

# setup joplin synch
#	automate through use of jmrweb repo update script

# setup zoom					Video Conferencing and Web Conferencing Service

# setup shared folders between vm and baremetal

# sync bookmarks



