#!/bin/bash
folderserver = ../sae_Firewall/server
folderclient = ../sae_Firewall/client


# check Vagrant install
if ! command -v vagrant &> /dev/null; then
    echo " Vagrant n'est pas installé."
    exit 1
else
    echo " Vagrant est installé : $(vagrant -v)"
fi

# check VirtualBox install
if ! command -v VBoxManage &> /dev/null; then
    echo " VirtualBox n'est pas installé."
    exit 1
else
    echo " VirtualBox est installé : $(VBoxManage -v)"
fi


### pushd et popd permet de changer de dossier "temporairement"
pushd ../sae_Firewall/server/
vagrant up
popd

pushd ../sae_Firewall/client/
vagrant up
popd
