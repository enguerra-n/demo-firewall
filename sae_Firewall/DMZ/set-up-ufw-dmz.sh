#!/bin/bash

# Réinitialiser les règles UFW
sudo ufw reset

# default deny
sudo ufw default deny incoming
sudo ufw default deny outgoing
sudo ufw default deny routed

# VB accept
sudo ufw allow in on lo
sudo ufw allow out on lo
sudo ufw allow in on eth0
sudo ufw allow out on eth0

# Accepter le trafic depuis le réseau 192.168.56.0/24 sur eth1
sudo ufw allow from 192.168.56.0/24 to any

# Autoriser HTTP (port 80) et HTTPS (port 443) sur eth2
sudo ufw allow in on eth2 to 192.168.56.100 port 80
sudo ufw allow in on eth2 to 192.168.56.100 port 443

# Autoriser le routage entre eth1 et eth2
sudo ufw route allow in on eth1 to out on eth2
sudo ufw route allow in on eth2 to out on eth1

# Activer UFW
yes y | sudo ufw enable
#sudo ufw enable
