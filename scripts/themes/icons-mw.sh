#!/bin/bash

function icons_install_MW {
    sudo rm -rf /tmp/icons
    mkdir -p /tmp/icons

    git clone https://github.com/mrwebfr/mrweb-icons.git /tmp/icons/mrweb-icons/

    rm -rf ~/.icons/Mrweb-*
    sudo rm -rf /usr/share/icons/Mrweb-*

    # mkdir -p ~/.icons/
    # cp -r /tmp/icons/mrweb-icons/Mrweb-* ~/.icons/
    sudo cp -r /tmp/icons/mrweb-icons/* /usr/share/icons/

    rm -rf /tmp/icons
}

function icons_remove_MW-Blue {
    sudo rm -rf /usr/share/icons/Mrweb-*
    rm -rf ~/.icons/Mrweb-*
}

function icons_MW {
    source scripts/functions.sh
    clear && banner
    
    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer / Mise à jour"
    "Supprimer"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Quitter")
                break
                ;;
            "Installer / Mise à jour")
                clear
                icons_install_MW
                gsettings set org.gnome.desktop.interface icon-theme "Humanity"
                sleep 1s
                gsettings set org.gnome.desktop.interface icon-theme "Mrweb-Flat-SkyBlue"
                break
                ;;
            "Supprimer")
                clear
                icons_remove_MW-Blue
                gsettings set org.gnome.desktop.interface icon-theme "Humanity"
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

source scripts/functions.sh

clear && banner

icons_MW

wait

bash setup.sh