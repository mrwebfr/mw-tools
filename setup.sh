#!/bin/bash
cp /tmp/mw_tools/tools.sh ~/tools.sh && chmod +x ~/tools.sh && clear
cd /tmp/mw_tools/
for file in app/functions/*.sh
do
    source "$file"
    chmod +x "$file"
done

function main() {

    PS3='
Veuillez faire un choix : '

    options=(
        "Quitter"
        "Mises à jour"
        "Nettoyage"
        "Outils"
        "Applications"
        "Test connexion"
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
                bash_cmd "dist_update"
                ;;
            "Nettoyage")
                bash_cmd "clean_full"
                ;;
            "Outils")
                bash_cmd "tools"
                ;;
            "Applications")
                bash_cmd "apps"
                ;;
            "Test connexion")
                bash_cmd "ip"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done

}

bash_cmd "main"
