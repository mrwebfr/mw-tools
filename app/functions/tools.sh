#!/bin/bash
function tools {
    PS3='
Veuillez faire un choix : '
    options=(
        "Retour"
        "Vider la Ram en cache"
        "SpeedTest"
        "IP réseau avec ARP"
        "Taille des disques {DFC}"
        "Taille des dossiers"
        "Taille racine {NCDU}"
        "Bios et Matériel"
        "Age du système"
        "Paramètres du wifi"
        "Informations du Wifi"
        "Informations Wifi disponibles"
        "Bluetooth enable"
        "Bluetooth disable"
        "Bluetooth start"
        "Bluetooth stop"
        "Terminal par défaut"
        "SGC"
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd_main
                ;;
            "Vider la Ram en cache")
                banner
                echo ""
                echo "----------------------------------------------"
                echo "Mémoire avant :"
                free -h && sudo sysctl vm.drop_caches=3
                echo "----------------------------------------------"
                echo "Mémoire après :"
                free -h
                echo "----------------------------------------------"
                echo ""
                wait
                bash_cmd "tools"
                ;;
            "SpeedTest")
                banner
                if ! dpkg -s 'speedtest-cli' >/dev/null 2>&1; then
                    sudo apt install speedtest-cli
                fi
                speedtest-cli
                wait
                bash_cmd "tools"
                ;;
            "IP réseau avec ARP")
                banner
                sudo ip -s -s neigh flush all
                sleep 5s
                echo ''
                echo '---------------------'
                echo ''
                sudo arp
                wait
                bash_cmd "tools"
                ;;
            "Taille des disques {DFC}")
                banner
                if ! dpkg -s 'dfc' >/dev/null 2>&1; then
                    sudo apt install dfc
                fi
                dfc -p /dev
                wait
                bash_cmd "tools"
                ;;
            "Taille des dossiers")
                banner
                echo "### $USER"
                sudo du -hs ~
                sudo du -hs ~/*
                echo ""
                echo "### Snap & Flatpak"
                sudo du -hs /snap/
                sudo du -hs ~/snap/
                sudo du -hs /var/lib/flatpak/
                sudo du -hs ~/.var
                echo ""
                echo "### Temp"
                sudo du -hs /tmp
                wait
                bash_cmd "tools"
                ;;
            "Taille racine {NCDU}")
                banner
                if ! dpkg -s 'ncdu' >/dev/null 2>&1; then
                    sudo apt install ncdu
                fi
                # echo "ncdu --exclude=/run/timeshift --exclude=/mnt --exclude=/media --exclude /run/user --exclude=/timeshift /"
                #ncdu --exclude=/run/timeshift --exclude=/mnt --exclude=/media --exclude /run/user --exclude=/timeshift /
                ncdu --exclude=/run/timeshift --exclude=/mnt --exclude=/media --exclude /run/user /
                wait
                bash_cmd "tools"
                ;;
            "Bios et Matériel")
                banner
                sudo dmidecode
                wait
                bash_cmd "tools"
                ;;
            "Age du système")
                banner
                sudo echo "ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'"
                ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'
                echo '---'
                echo "sudo dumpe2fs -h $(df | awk '/\/$/ {print $1}') | grep created"
                sudo dumpe2fs -h $(df | awk '/\/$/ {print $1}') | grep created
                echo '---'
                echo 'Informations sur la partition : sudo tune2fs -l /dev/sdb1'
                wait
                bash_cmd "tools"
                ;;
            "Paramètres du wifi")
                banner
                nm-connection-editor
                wait
                bash_cmd "tools"
                ;;
            "Informations du Wifi")
                banner
                wavemon
                wait
                bash_cmd "tools"
                ;;
            "Informations Wifi disponibles")
                banner
                sudo nmcli dev wifi rescan
                sudo nmcli -f ALL dev wifi
                wait
                bash_cmd "tools"
                ;;
            "Bluetooth enable")
                banner
                sudo systemctl enable bluetooth.service
                wait
                bash_cmd "tools"
                ;;
            "Bluetooth disable")
                banner
                sudo systemctl disable bluetooth.service
                wait
                bash_cmd "tools"
                ;;
            "Bluetooth start")
                banner
                sudo systemctl start bluetooth.service
                wait
                bash_cmd "tools"
                ;;
            "Bluetooth stop")
                banner
                sudo systemctl stop bluetooth.service
                wait
                bash_cmd "tools"
                ;;
            "Terminal par défaut")
                banner
                sudo update-alternatives --config x-terminal-emulator
                wait
                bash_cmd "tools"
                ;;
            "SGC")
                banner
                bash_cmd "sgc"
                ;;
        esac
    done
}