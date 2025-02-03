#Insatall on all servers

#!/bin/bash

yum install nano epel-release -y 
yum install ntpdate pacemaker pcs resource-agents -y
yum install -y corosync samba ctdb policycoreutils-python # IF NEED CREATE SAMBA CLUSTER
\cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime
ntpdate ru.pool.ntp.org
firewall-cmd --permanent --add-service=high-availability
firewall-cmd --reload
passwd hacluster
systemctl enable pcsd
systemctl start pcsd
