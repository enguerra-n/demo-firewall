#!/bin/bash

# Réinitialiser les règles UFW
sudo ufw reset

# Définir les politiques par défaut sur "deny"
sudo ufw default deny incoming
sudo ufw default deny outgoing
sudo ufw default deny routed

# Accepter le trafic local (loopback) sur 'lo' et 'eth0'
sudo ufw allow in on lo
sudo ufw allow out on lo
sudo ufw allow in on eth0
sudo ufw allow out on eth0

# Accepter le trafic depuis le réseau 192.168.56.0/24 sur eth1
sudo ufw allow from 192.168.56.0/24 to any

# Autoriser HTTP (port 80) et HTTPS (port 443) sur eth2 pour l'adresse 192.168.56.100
sudo ufw allow in on eth2 to 192.168.56.100 port 80
sudo ufw allow in on eth2 to 192.168.56.100 port 443

# Autoriser le routage entre eth1 et eth2
sudo ufw route allow in on eth1 to out on eth2
sudo ufw route allow in on eth2 to out on eth1

# Ajouter les règles ICMP pour accepter les pings (Echo Requests)
sudo sed -i '/^# allow all icmp/a -A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT' /etc/ufw/before.rules
sudo sed -i '/^# allow all icmp/a -A ufw-before-output -p icmp --icmp-type echo-request -j ACCEPT' /etc/ufw/before.rules

# Activer UFW (répondre "yes" automatiquement)
yes y | sudo ufw enable
#sudo ufw enable
