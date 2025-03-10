#!/bin/bash

# purge des règles 
iptables -F
iptables -t nat -F
iptables -X


# on bloque tout
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP


# accept local
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -i eth0 -j ACCEPT
iptables -A OUTPUT -o eth0 -j ACCEPT


# accept any from 56 network
iptables -A INPUT -i eth1 -s 192.168.56.0/24 -j ACCEPT


# Autoriser 80 et 443 depuis internet
iptables -A INPUT -i eth2 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth2 -p tcp --dport 443 -j ACCEPT


# Autoriser le routage
iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT


# Configurer le NAT pour permettre à DMZ d'accéder à Internet
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE

# Sauvegarder les règles iptables avec iptables-persistent
#apt-get install -y iptables-persistent
#netfilter-persistent save