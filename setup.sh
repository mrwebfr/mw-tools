#!/bin/bash

function main() {
    banner

    PS3='
Veuillez faire un choix : '

    options=(
        "Quitter"
        "Mises à jour"
        "Nettoyage"
        "Applications"
        "Outils"
        "Thèmes"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Quitter")
                rm -rf /tmp/mw_tools/
                clear
                exit
                ;;
            "Mises à jour")
                run_script "scripts/dist_update.sh"
                break
                ;;
            "Nettoyage")
                run_script "scripts/dist_clean.sh"
                break
                ;;
            "Applications")
                run_script "scripts/app.sh"
                break
                ;;
            "Outils")
                run_script "scripts/tools.sh"
                break
                ;;
            "Thèmes")
                run_script "scripts/themes.sh"
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done

}
cp /tmp/mw_tools/tools.sh ~/tools.sh
chmod +x ~/tools.sh
clear
cd /tmp/mw_tools/
chmod +x scripts/functions.sh
source scripts/functions.sh

main
