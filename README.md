# Projet : Mise en place d’un Firewall et durcissement d’un serveur Web

## 🎯 Objectifs
- **Installer un firewall** pour filtrer les flux de données et protéger le réseau local.
- **Durcir le serveur Web Nginx** pour réduire les failles de sécurité.
- **Mettre en place une DMZ** (zone démilitarisée) pour renforcer la sécurité réseau.

## 🛠️ Environnement et Prérequis
- **VM Debian** avec **Vagrant** pour gérer les machines virtuelles.
- Utilisation de **ufw** (Uncomplicated Firewall) pour configurer le firewall.
- **Test de pénétration** avec des outils comme **nmap** et **Wireshark** pour valider l'efficacité des sécurisations.

## 📋 Modalités pratiques
- Durée du projet : **2 semaines**.
- Travail en **équipe de 2** (ou 3 dans un effectif impair).
- Dépôt sur **GitHub** (`demo-firewall`) incluant :
  - Scripts de configuration des VMs.
  - Scripts de démonstration du fonctionnement du firewall.
  - Journal de travail.

## 🔥 Les différents service de firewall
- **IPTABLE** 
- **FIREWALLD**
- **UFW**
  
| NOM| `iptables` | `firewalld` | `ufw` |
|---------------------- |------------|------------|------|
| **Facilité d’utilisation** | ❌ Complexe (commandes longues) | ✅ Simple (zones et services) | ✅ Très simple (commandes courtes) |
| **Dynamisme** | ❌ Statique (redémarrage requis) | ✅ Dynamique (modifications à chaud) | ❌ Nécessite un rechargement |
| **Performance** | ✅ Rapide et léger | ❌ Légèrement plus gourmand | ✅ Léger et efficace |
| **Flexibilité** | ✅ Très configurable | ❌ Moins adapté aux besoins avancés | ❌ Moins flexible qu’`iptables` |
| **Gestion des règles** | ❌ Moins intuitif | ✅ Plus clair grâce aux zones | ✅ Facile grâce à une syntaxe simplifiée |
| **Compatibilité** | ✅ Supporté par toutes les distributions | ✅ Par défaut sur RHEL, CentOS, Fedora | ✅ Disponible sur Debian, Ubuntu (par défaut) |





## 🛡️ Sécurisation du Serveur Web Nginx
- **Nginx** : Serveur web flexible mais vulnérable par défaut.
- Objectif : Appliquer des configurations renforcées pour sécuriser le serveur.

## 📝 Etapes du Travail
1. **Création des VMs** avec Vagrant (2 VMs : serveur et client).
2. **Installation de Nginx** et du **firewall** sur le serveur.
3. **Tests manuels** pour vérifier la configuration.
4. **Sécurisation du serveur** en appliquant des configurations renforcées avec `ufw` et `IPTABLES`.
5. **Création de scripts** pour automatiser la configuration du firewall et tester les règles de sécurité.

## ⚙️ Outils Utilisés
- **Vagrant** : Gestion des VMs.
- **ufw** : Configuration du firewall.
- **nmap** : Outil de test de sécurité.
- **Nginx** : Serveur web.

## 📂 Livrables
- Scripts de configuration des VMs.
- Scripts de démonstration du firewall.
- Journal de travail détaillant les étapes réalisées.
