#!/bin/bash

# Fonction pour afficher l'usage du script
usage() {
    echo "Usage: $0 -a|--allow port   Autoriser le port"
    echo "       $0 -r|--reject port   Rejeter le port"
    echo "       $0 -d|--disable-ipv6   Désactiver IPv6"
    exit 1
}

# Vérification que UFW est installé
if ! command -v sudo ufw &> /dev/null; then
    echo "UFW n'est pas installé. Installez-le avec : sudo apt install ufw"
    exit 1
fi

# Vérification des arguments
if [ $# -eq 0 ]; then
    usage
fi

# Traitement des arguments
while getopts "a:r:d" opt; do
    case ${opt} in
        a)
            # Autoriser le port
            PORT=$OPTARG
            echo "Autorisation du port $PORT..."
            sudo ufw allow $PORT
            ;;
        r)
            # Rejeter le port
            PORT=$OPTARG
            echo "Rejet du port $PORT..."
            sudo ufw deny $PORT
            ;;
        d)
            # Désactiver IPv6
            echo "Désactivation de l'IPv6 dans la configuration de UFW..."
            sudo sed -i 's/^IPV6=yes/IPV6=no/' /etc/default/ufw
            ;;
        *)
            usage
            ;;
    esac
done

# Activer ou recharger UFW pour appliquer les changements
echo "Recharge des règles UFW..."
sudo ufw reload

# Affichage de l'état actuel de UFW
echo "État actuel de UFW :"
sudo ufw status verbose
