#!/bin/bash

LB_IP="172.16.238.14"
PORT="8086"

# Install & start iptables service
yum install -y iptables-services
systemctl enable iptables
systemctl start iptables

# Remove old rules (ignore errors)
iptables -D INPUT -p tcp -s $LB_IP --dport $PORT -j ACCEPT 2>/dev/null
iptables -D INPUT -p tcp --dport $PORT -j DROP 2>/dev/null

# Insert rules before default REJECT
iptables -I INPUT -p tcp -s $LB_IP --dport $PORT -j ACCEPT
iptables -I INPUT -p tcp --dport $PORT -j DROP

# Save rules
service iptables save

# Show result
iptables -L INPUT -n --line-numbers | grep $PORT
