#!/bin/sh
LAB_INSTALL_DIR=~/labs
install_configuration() {
	echo "Installing packages"
	sudo apt update -y
	sudo apt install -y software-properties-common
	sudo apt-add-repository --yes --update ppa:ansible/ansible
	sudo apt install -y ansible wireshark
	sudo apt install -y chromium-browser
	sudo snap install --classic code
	sudo apt install -y python3 python3-pip
	pip3 install flask
	echo "installing labs in $LAB_INSTALL_DIR"
	cd ~
	git clone https://github.com/KieranCrossland/cisco-labs-backup $LAB_INSTALL_DIR
	echo ""
	echo "Cisco packet tracer is not in any repositories, you will have to install it seperately."
 	echo "install completed"
  	xdg-open $LAB_INSTALL_DIR

}

main() {
    echo "(Kieran Crossland, Denys Dreyzer, Damian Kaminski, Shafi-al Islam. 2023)"
    echo "Hello and welcome to Cisco VM configuration script."
    echo "Would you like to proceed with the installation? (yes/no)"
    read answer
	if [ "$answer" = "yes" ]; then
		echo "Starting installation."
		install_configuration
	else
        	echo "Installation aborted."
		exit
    	fi
}

main

