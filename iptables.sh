#!/bin/bash
# iptables.sh
# Created by Tyler Payne
# Last modified 1/31/2012
#run as root

# Deleteand flush. Default table is "filter". Others like "nat" must be explicitly stated.
iptables --flush
iptables --table nat --flush
iptables --delete-chain

#Allow full access to the loopback interface (ie 127.0.0.1)
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#Setup ip forarding and NAT
iptables --table nat --append POSTROUTING --out-interface eth0 -j MASQUERADE
iptables --append FORWARD --in-interface eth1 -j ACCEPT

#Ports allowed through external interface
iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

#Allow all trafic from internal network
iptables --append INPUT -i eth1 -s 10.0.0.0/24 -j ACCEPT

#Default policies if packets do not match any of the above rules
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

#save the new iptables rules and restart iptables
service iptables save
service iptables restart
