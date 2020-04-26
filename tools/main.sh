#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables - and source func.sh
# ----------------------------------
source ./func.sh
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 

show_menus() {
        clear
        echo "~~~~~~~~~~~~~~~~~~~~~"    
        echo " M A I N - M E N U"
        echo "~~~~~~~~~~~~~~~~~~~~~"
        echo "1. Install Ansible"
        echo "2. Install Haproxy"
        echo "3. Install Docker-ce"
        echo "4. Install Zabbix-Server"
        echo "5. Install Zabbix-Agent"
        echo "6. Exit"
}
read_options(){
	local choice
	read -p "Enter choice [ 1 - 6] " choice
	case $choice in
		1) Install_Ansible ;;
		2) Install_Haproxy ;;
		3) Install_Docker;;
		4) Install_Zabbix_Server;;
		5) Install_Zabbix_Agent;;
		6) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
#trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done

