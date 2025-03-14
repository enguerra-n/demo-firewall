#!/bin/bash

# Fonction pour afficher l'usage du script
usage() {
    echo "Usage: $0 -a|--allow port   Autoriser le port"
    echo "       $0 -r|--reject port   Rejeter le port"
    echo "       $0 -i|--disable-ipv6   Désactiver IPv6"
    echo "       $0 -z|--statut-rules   affiche le statut et les règles"
    echo "       $0 -S|--deny subnet   rejecter un réseau"
    echo "       $0 -H|--deny host   rejecter un hôte"
    echo "       $0 -s|--allow subnet   accepter un réseau"
    echo "       $0 -h|--allow host   accepter un hôte"
    echo "       $0 -l|--limit connection ssh"
    echo "       $0 -e|--enable ufw"
    echo "       $0 -d|--disable ufw"
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
while getopts "a:r:izS:H:s:h:l:ed" opt; do
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
        i)
            # Désactiver IPv6
            echo "Désactivation de l'IPv6 dans la configuration de UFW..."
            sudo sed -i 's/^IPV6=yes/IPV6=no/' /etc/default/ufw
            exit 0
            ;;
        z)
            # afficher le statut
            echo "statut de ufw : "
            sudo ufw status verbose
            exit 0
            ;;
        S)
            # refuse le subnet
            SUBNET=$OPTARG
            echo "Autorisation du subnet $SUBNET"
            sudo ufw deny from "$SUBNET" to any 
            ;;
        H)
            # refuser l'host
            HOST=$OPTARG
            echo "Autorisation de l hote $HOST"
            sudo ufw deny from "$HOST" to any
            ;;
        s)
            # Autoriser le subnet
            SUBNET=$OPTARG
            echo "Autorisation du subnet $SUBNET"
            sudo ufw allow from "$SUBNET" to any
            ;;
        h)
            # Autoriser l'host
            HOST=$OPTARG
            echo "Autorisation de l hote $HOST"
            sudo ufw allow from "$HOST" to any
            ;;
        l)
            # limitation port tcp
            port=$OPTARG
            echo "limitation du port $port en tcp"
            sudo sudo ufw limit "$port"/tcp
            ;;
        e)
            # activer ufw
            yes y | sudo ufw enable
            exit 0
            ;;
        d)
            # desactiver ufw
            sudo ufw disable
            exit 0
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

