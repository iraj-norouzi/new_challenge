#!/bin/bash

Install_Docker(){
        bash ./script/install_docker.sh
        pause
}
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

Install_Ansible(){
        yum install ansible -y
        pause
}

# do something in two()
Install_Haproxy(){
        yum install haproxy -y
        pause
}

# function to display menus

