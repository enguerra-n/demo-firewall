#!/bin/bash

# Définition des couleurs
VERT="\e[32m"
ROUGE="\e[31m"
BLEU="\e[34m"
RESET="\e[0m"

echo -e "${BLEU}###################################${RESET}"
echo -e "${BLEU}#  Tests de sécurité pour 'client' #${RESET}"
echo -e "${BLEU}###################################${RESET}"

SERVER_IP="192.168.56.100" # Remplacez par l'IP du serveur si nécessaire

# 1. Vérification de la connectivité au serveur (ping)
echo -n "Vérification de la connectivité au serveur (ping): "
if ping -c 4 $SERVER_IP > /dev/null; then
  echo -e "${VERT}OK${RESET}"
else
  echo -e "${ROUGE}ÉCHEC${RESET}"
fi

# 2. Vérification de l'accès à la page web du serveur (curl)
echo -n "Vérification de l'accès à la page web du serveur (curl): "
if curl -sSL -w "%{http_code}" $SERVER_IP -o /dev/null | grep -q "200"; then
  echo -e "${VERT}OK${RESET}"
else
  echo -e "${ROUGE}ÉCHEC${RESET}"
fi

# 3. Vérification du port SSH ouvert (nmap)
echo -n "Vérification du port SSH ouvert (nmap): "
NMAP_OUTPUT=$(nmap -p 22 $SERVER_IP | grep "22/tcp")
if [[ -n "$NMAP_OUTPUT" ]]; then
  PORT_STATE=$(echo "$NMAP_OUTPUT" | awk '{print $2}')
  echo -e "${BLEU}Port 22:${RESET} ${VERT}$PORT_STATE${RESET}"
else
  echo -e "${BLEU}Port 22:${RESET} ${ROUGE}Fermé${RESET}"
fi

# 4. Vérification du port HTTP ouvert (nmap)
echo -n "Vérification du port HTTP ouvert (nmap): "
NMAP_OUTPUT=$(nmap -p 80 $SERVER_IP | grep "80/tcp")
if [[ -n "$NMAP_OUTPUT" ]]; then
  PORT_STATE=$(echo "$NMAP_OUTPUT" | awk '{print $2}')
  echo -e "${BLEU}Port 80:${RESET} ${VERT}$PORT_STATE${RESET}"
else
  echo -e "${BLEU}Port 80:${RESET} ${ROUGE}Fermé${RESET}"
fi

echo -e "${BLEU}##################################${RESET}"
echo -e "${BLEU}# Fin des tests pour 'client'      #${RESET}"
echo -e "${BLEU}##################################${RESET}"
