#!/bin/bash
function f_tools_gnome_vanilla {

PS3='
Veuillez faire un choix : '
options=(
"Retour"
"Choisir le Terminal par défaut - [Ubuntu]"
"Supprimer les extensions par défaut - [Ubuntu]"
"Gnome Vanilla - Installer Gnome Session - [Ubuntu]"
"Gnome Vanilla - Choisir GDM (Ubuntu 20.04) - [Ubuntu]"
"Gnome Vanilla - Supprimer Ubuntu Session - [Ubuntu]"
"Gnome Vanilla - Installer Vanilla Gnome Desktop - [Ubuntu]"
)
select opt in "${options[@]}"
do
    case $opt in
        "Retour")
            break
            ;;
        "Choisir le Terminal par défaut - [Ubuntu]")
            clear
            sudo update-alternatives --config x-terminal-emulator
            break
            ;;
        "Supprimer les extensions par défaut - [Ubuntu]")
            clear
            sudo apt autoremove gnome-shell-extensions
            break
            ;;
        "Gnome Vanilla - Installer Gnome Session - [Ubuntu]")
            clear
            sudo apt install gnome-session gdm3
            break
            ;;
        "Gnome Vanilla - Choisir GDM (Ubuntu 20.04) - [Ubuntu]")
            clear
            sudo update-alternatives --config gdm3-theme.gresource
            break
            ;;
        "Gnome Vanilla - Supprimer Ubuntu Session - [Ubuntu]")
            clear
            sudo apt autoremove ubuntu-{session,settings}
            break
            ;;
        "Gnome Vanilla - Installer Vanilla Gnome Desktop - [Ubuntu]")
            clear
            sudo apt install vanilla-gnome-desktop
            break
            ;;
    esac
done

}
