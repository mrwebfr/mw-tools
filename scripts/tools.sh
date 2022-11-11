#!/bin/bash
function f_tools {
    PS3='
Veuillez faire un choix : '
    options=(
        "Retour"
        "Vider la Ram en cache"
        "SpeedTest"
        "Réseau"
        "HDD, Bios et Matériel"
        "Informations Wifi"
        "Informations Bluetooth"
        "SGC"
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash setup.sh
                break
                ;;
            "Vider la Ram en cache")
                clear
                run_script "scripts/tools/ram.sh"
                break
                ;;
            "SpeedTest")
                clear
                if ! dpkg -s 'speedtest-cli' >/dev/null 2>&1; then
                    sudo apt install speedtest-cli
                fi
                speedtest-cli
                break
                ;;
            "Réseau")
                clear
                run_script "scripts/tools/network.sh"
                break
                ;;
            "HDD, Bios et Matériel")
                clear
                run_script "scripts/tools/hdd.sh"
                break
                ;;
            "Informations Wifi")
                clear
                run_script "scripts/tools/wifi.sh"
                break
                ;;
            "Informations Bluetooth")
                clear
                run_script "scripts/tools/bluetooth.sh"
                break
                ;;
            "SGC")
                clear
                run_script "scripts/tools/sgc.sh"
                f_tools_sgc
                break
                ;;
        esac
    done
}

source scripts/functions.sh

clear && banner

f_tools