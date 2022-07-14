#!/bin/bash
function theme_install_otis {
    sudo rm -rf /tmp/themes
    mkdir -p /tmp/themes

    git clone https://github.com/EliverLara/Otis.git /tmp/themes/Otis/
    flatpak override --user --filesystem=xdg-config/gtk-4.0 --filesystem=home/.themes/

    FILE=/tmp/themes/Otis/gtk-4.0/
    if [ -d "$FILE" ]; then
        directory=~/.themes/
        # directory=/usr/share/themes/

        mkdir -p ~/.themes
        rm -rf ~/.themes/Otis*
        sudo rm -rf /usr/share/themes/Otis*

        sudo cp -r /tmp/themes/* $directory
        sudo chown -R $(id -u):$(id -g) $HOME/.themes

        sudo rm -rf /tmp/themes

    else
        echo "Il y a un problème !"
    fi
}

function theme_remove_otis {
    rm -rf ~/.themes/Otis*
    rm -rf ~/.themes/Mrweb-Otis-*
    sudo rm -rf /usr/share/themes/Otis*
    sudo rm -rf /usr/share/themes/Mrweb-Otis-*
}

function theme_otis {
    source scripts/functions.sh
    clear && banner
    
    PS3='
Veuillez faire un choix : '

    options=(
    "Retour"
    "Installer / Mise à jour"
    "Supprimer"
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash setup.sh
                break
                ;;
            "Installer / Mise à jour")
                clear
                theme_install_otis
                break
                ;;
            "Supprimer")
                clear
                theme_remove_otis
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

source scripts/functions.sh

clear && banner

theme_otis