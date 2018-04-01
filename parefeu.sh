#!/bin/sh

   #On Flush
        iptables -F
   # Politiques
        iptables -P OUTPUT DROP
        iptables -P INPUT DROP
        iptables -P FORWARD DROP
   # Connection etablie
        iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
        iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
   #Autriser le loopback
        iptables -A INPUT -i lo -j ACCEPT
        iptables -A OUTPUT -o lo -j ACCEPT
   #SSH
        iptables -A INPUT -p tcp --dport 22 -j ACCEPT
   #HTTP
        iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
        iptables -A OUTPUT -p tcp --dport 8080 -j ACCEPT

