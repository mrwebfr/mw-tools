#!/bin/bash
function f_tools_nm-connection-editor {
    nm-connection-editor
}

function f_tools_wavemon {
    wavemon
}

function f_tools_nmcli {
    sudo nmcli dev wifi rescan
    sudo nmcli -f ALL dev wifi
}

function f_tools_wifi {
    options=("Retour" "Paramètres du wifi" "Informations du Wifi" "Informations Wifi disponibles")
    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                clear
                break
                ;;
            "Paramètres du wifi")
                clear
                f_tools_nm-connection-editor
                break
                ;;
            "Informations du Wifi")
                clear
                f_tools_wavemon
                break
                ;;
            "Informations Wifi disponibles")
                clear
                f_tools_nmcli
                break
                ;;
        esac
    done
}
f_tools_wifi