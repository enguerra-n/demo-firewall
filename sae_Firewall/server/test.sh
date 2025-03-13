#!/bin/bash

# Définition des couleurs
VERT="\e[32m"
ROUGE="\e[31m"
BLEU="\e[34m"
RESET="\e[0m"

echo -e "${BLEU}##################################${RESET}"
echo -e "${BLEU}# Tests de sécurité pour 'server' #${RESET}"
echo -e "${BLEU}##################################${RESET}"

# 1. Vérification de l'accès à la page web depuis localhost (curl)
echo -n "Vérification de l'accès à la page web depuis localhost (curl): "
if curl -sSL -w "%{http_code}" localhost -o /dev/null | grep -q "200"; then
  echo -e "${VERT}OK${RESET}"
else
  echo -e "${ROUGE}ÉCHEC${RESET}"
fi

# 2. Vérification de l'état du service Nginx
echo -n "Vérification de l'état du service Nginx: "
if systemctl is-active nginx > /dev/null; then
  echo -e "${VERT}OK${RESET}"
else
  echo -e "${ROUGE}ÉCHEC${RESET}"
fi

echo -e "${BLEU}##################################${RESET}"
echo -e "${BLEU}# Fin des tests pour 'server'      #${RESET}"
echo -e "${BLEU}##################################${RESET}"
