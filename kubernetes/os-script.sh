#!/bin/bash
echo "nameserver 178.22.122.100" > /etc/resolv.conf
echo "nameserver  185.51.200.2" >> /etc/resolv.confyum -y install epel-release

#Disable selinux
sed -i 's/enforcing/disabled/g' /etc/selinux/config
setenforce 0

#Disable firewalld.service
systemctl stop firewalld
systemctl disable firewalld

#Install screen
yum -y install wget screen net-tools sysstat iftop bmon

systemctl start sysstat
systemctl enable sysstat

#Install docker

yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine -y

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2


yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
systemctl status docker
ocker -v


curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Install zabbix-agent
#rpm -Uvh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-1.el7.noarch.rpm
#yum -y install zabbix-agent
#sed -i 's/127.0.0.1/10.11.12.99/g' /etc/zabbix/zabbix_agentd.conf
#sed -i 's/Hostname=Zabbix server/Hostname=monitor/g' /etc/zabbix/zabbix_agentd.conf
#iptables -A INPUT -p tcp -s 10.11.12.99 --dport 10050 -m state --state NEW,ESTABLISHED -j ACCEPT
#systemctl start zabbix-agent
#systemctl enable zabbix-agent

#Update kernel & Install ...
yum -y update
yum -y install yum-plugin-fastestmirror
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum -y --enablerepo=elrepo-kernel install kernel-ml
sudo awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
sudo grub2-set-default 0
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
package-cleanup --oldkernels

echo "     #######################################################################" 	>> /etc/ssh/sshd-banner
echo "     #                   Welcome to iGap Messenger                         #" 	>> /etc/ssh/sshd-banner
echo "     #                                                                     #" 	>> /etc/ssh/sshd-banner
echo "     #            All connections are monitored and recorded               #" 	>> /etc/ssh/sshd-banner
echo "     #                                                                     #" 	>> /etc/ssh/sshd-banner
echo "     #     Disconnect IMMEDIATELY if you are not an authorized user!       #" 	>> /etc/ssh/sshd-banner    
echo "     #######################################################################" 	>> /etc/ssh/sshd-banner
echo -e " _  _____                                                                  "	>> /etc/ssh/sshd-banner   
echo -e "(_)/ ____|                                                                 "	>> /etc/ssh/sshd-banner
echo -e " _| |  __  __ _ _ __    _ __ ___   ___  ___ ___  ___ _ __   __ _  ___  ___ "	>> /etc/ssh/sshd-banner
echo -e "| | | |_ |/ _| | |_ \  | |_ | _ \ / _ \/ __/ __|/ _ \ |_ \ / _| |/ _ \ |__|" 	>> /etc/ssh/sshd-banner
echo -e "| | |__| | (_| | |_) | | | | | | |  __/\__ \__ \  __/ | | | (_| |  __/ |   " 	>> /etc/ssh/sshd-banner
echo -e "|_|\_____|\__,_| .__/  |_| |_| |_|\___||___/___/\___|_| |_|\__, |\___|_|   " 	>> /etc/ssh/sshd-banner
echo -e "               | |                                          __/ |          " 	>> /etc/ssh/sshd-banner
echo -e "               |_|                                         |___/           " 	>> /etc/ssh/sshd-banner
echo -e " 		                                                            "	>> /etc/ssh/sshd-banner

sed -i 's/\#Banner none/Banner \/etc\/ssh\/sshd-banner/g' /etc/ssh/sshd_config
echo 
timedatectl set-ntp yes
#timedatectl set-timezone Asia/Tehran
echo "UseDNS no" >>/etc/ssh/sshd_config
echo "UsePAM no" >>/etc/ssh/sshd_config
systemctl restart sshd
