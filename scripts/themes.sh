#!/bin/bash

function themes {
    PS3='
Veuillez faire un choix : '
    options=(
        "Retour"
        "MW - Icônes"
        "Flat Remix - Thèmes"
        "Otis - Thèmes"
        "Flatpak Themes"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash setup.sh
                break
                ;;
            "MW - Icônes")
                run_script "scripts/themes/icons-mw.sh"
                break
                ;;
            "Flat Remix - Thèmes")
                run_script "scripts/themes/theme-flat-remix.sh"
                break
                ;;
            "Otis - Thèmes")
                run_script "scripts/themes/theme-otis.sh"
                break
                ;;
            "Flatpak Themes")
                flatpak override --user --filesystem=xdg-config/gtk-4.0 --filesystem=home/.themes/
                wait
                source setup.sh
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

source scripts/functions.sh

clear && banner

themes