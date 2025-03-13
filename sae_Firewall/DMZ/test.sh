#!/bin/bash

# Définition des couleurs
VERT="\e[32m"
ROUGE="\e[31m"
BLEU="\e[34m"
RESET="\e[0m"

echo -e "${BLEU}##################################${RESET}"
echo -e "${BLEU}#   Tests de sécurité pour 'dmz'   #${RESET}"
echo -e "${BLEU}##################################${RESET}"

# 1. Vérification de l'état du service UFW
echo -n "Vérification de l'état du service UFW: "
if systemctl is-active ufw > /dev/null; then
  echo -e "${VERT}OK${RESET}"
else
  echo -e "${ROUGE}ÉCHEC${RESET}"
fi

echo -e "${BLEU}##################################${RESET}"
echo -e "${BLEU}#  Fin des tests pour 'dmz'       #${RESET}"
echo -e "${BLEU}##################################${RESET}"
