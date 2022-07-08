#!/bin/bash

function main() {
    banner

    PS3='
Veuillez faire un choix : '

    options=(
        "Quitter"
        "Mises à jour"
        "Nettoyage"
        "Thèmes"
        "Applications"
        "Outils"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Quitter")
                # clear
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
            "Thèmes")
                run_script "scripts/themes.sh"
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
            *) echo "invalid option $REPLY";;
        esac
    done

}

cp /tmp/mw_tools/tools.sh ~/tools.sh
chmod +x ~/tools.sh
# clear

chmod +x /tmp/mw_tools/scripts/functions.sh
source /tmp/mw_tools/scripts/functions.sh

main