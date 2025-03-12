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

# Accepter le trafic depuis le réseau 192.168.56.0/24 
sudo ufw allow from 192.168.56.0/24 to any

#sudo ufw deny in on eth2 to any
# autoriser 80 et 443 sur eth2 pour le serveur
sudo ufw route allow to 192.168.56.100 port 80
sudo ufw route allow to 192.168.56.100 port 443

#autoriser le LAN a ssh le srv seulement
sudo ufw allow from 192.168.56.100 to 192.168.56.100 port 22


sudo ufw allow in on eth1 to any port 80
sudo ufw allow in on eth1 to any port 443

sudo sed -i '/COMMIT/i -A ufw-before-output -p icmp --icmp-type echo-request -j ACCEPT' /etc/ufw/before.rules
sudo sed -i '/COMMIT/i -A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT' /etc/ufw/before.rules

# Activer UFW 
yes y | sudo ufw enable
sudo ufw reload
