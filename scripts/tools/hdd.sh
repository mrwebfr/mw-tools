#!/bin/bash
function f_tools_hdd_dfc {
    if ! dpkg -s 'dfc' >/dev/null 2>&1; then
        sudo apt install dfc
    fi
    dfc -p /dev
}

function f_tools_hdd_du {
    echo "### $USER"
    sudo du -hs ~
    sudo du -hs ~/*
    echo "
    ### Snap & Flatpak"
    sudo du -hs /snap/
    sudo du -hs ~/snap/
    sudo du -hs /var/lib/flatpak/
    sudo du -hs ~/.var
    echo "
    ### Temp"
    sudo du -hs /tmp
}

function f_tools_hdd_ncdu {
    if ! dpkg -s 'ncdu' >/dev/null 2>&1; then
        sudo apt install ncdu
    fi
    # echo "ncdu --exclude=/run/timeshift --exclude=/mnt --exclude=/media --exclude /run/user --exclude=/timeshift /"
    #ncdu --exclude=/run/timeshift --exclude=/mnt --exclude=/media --exclude /run/user --exclude=/timeshift /
    ncdu --exclude=/run/timeshift --exclude=/mnt --exclude=/media --exclude /run/user /
}

function f_tools_hdd {
    options=("Retour" "Taille des disques {DFC}" "Taille des dossiers" "Taille racine {NCDU}" "Bios et Matériel" "Age du système")
    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash setup.sh
                break
                ;;
            "Taille des disques {DFC}")
                clear
                f_tools_hdd_dfc
                break
                ;;
            "Taille des dossiers")
                clear
                f_tools_hdd_du
                break
                ;;
            "Taille racine {NCDU}")
                clear
                f_tools_hdd_ncdu
                break
                ;;
            "Bios et Matériel")
                clear
                sudo dmidecode
                break
                ;;
            "Age du système")
                clear
                sudo echo "ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'"
                ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'
                echo '---'
                echo "sudo dumpe2fs -h $(df | awk '/\/$/ {print $1}') | grep created"
                sudo dumpe2fs -h $(df | awk '/\/$/ {print $1}') | grep created
                echo '---'
                echo 'Informations sur la partition : sudo tune2fs -l /dev/sdb1'
                break
                ;;
        esac
    done
}

source scripts/functions.sh

clear && banner

f_tools_hdd