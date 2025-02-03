#!/bin/bash

pcs cluster auth node1 node2 node3 -u hacluster
pcs cluster setup --force --name NLB node1 node2 node3
pcs cluster enable --all
pcs cluster start --all
pcs property set stonith-enabled=false
pcs property set no-quorum-policy=ignore
pcs status
pcs resource create VirtualIP ocf:heartbeat:IPaddr2 ip=192.168.0.15 cidr_netmask=24 op monitor interval=30s # Change ip on your need ip address
ip addr show
pcs status (Example: virtual_ip     (ocf::heartbeat:IPaddr2):       Started node1)
pcs resource create WebServer ocf:heartbeat:apache configfile=/etc/httpd/conf/httpd.conf op monitor interval=30s
pcs constraint colocation add WebServer with VirtualIP INFINITY
pcs constraint order VirtualIP then WebServer
pcs status
