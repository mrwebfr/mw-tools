#!/bin/bash

function dist_update {

    if [ "$OS" == "ubuntu" ]; then

        if ! dpkg -s 'git' >/dev/null 2>&1; then
            sudo apt install git -y
        fi

        if ! dpkg -s 'subversion' >/dev/null 2>&1; then
            sudo apt install subversion -y
        fi

        if ! dpkg -s 'curl' >/dev/null 2>&1; then
            sudo apt install curl -y
        fi

        sudo apt update && sudo apt upgrade && sudo apt full-upgrade
        
        sudo snap refresh

        flatpak update -y

        echo ""
        echo "Votre PC est à jour ! "

    elif [ "$OS" == "fedora" ]; then

        sudo dnf install -y git subversion curl

        sudo sudo dnf upgrade && sudo dnf distro-sync

        flatpak update -y

        sudo snap refresh

        echo ""
        echo "Votre PC est à jour ! "

    fi

}

