# PaceMakerCentos7Basics

IF YOU USER CENTOS 7 IN 2025 and next ADD REPO

sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/CentOS* && \
sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/CentOS* && \
sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/CentOS*

pcs resource move WebServer node3 # Choice and other node number for testing

systemctl stop pacemaker
