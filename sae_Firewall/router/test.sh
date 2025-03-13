#!/bin/bash

# Définition des couleurs
VERT="\e[32m"
ROUGE="\e[31m"
BLEU="\e[34m"
RESET="\e[0m"

echo -e "${BLEU}##################################${RESET}"
echo -e "${BLEU}#  Tests de configuration pour 'router' #${RESET}"
echo -e "${BLEU}##################################${RESET}"

# 1. Vérification du forwarding IP
echo -n "Vérification du forwarding IP (sysctl): "
if sudo sysctl net.ipv4.ip_forward | grep -q "net.ipv4.ip_forward = 1"; then
  echo -e "${VERT}OK${RESET}"
else
  echo -e "${ROUGE}ÉCHEC${RESET}"
fi

echo -e "${BLEU}##################################${RESET}"
echo -e "${BLEU}# Fin des tests pour 'router'      #${RESET}"
echo -e "${BLEU}##################################${RESET}"
