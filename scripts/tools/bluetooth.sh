#!/bin/bash
function f_tools_bluetooth_enable {
    sudo systemctl enable bluetooth.service
}

function f_tools_bluetooth_disable {
    sudo systemctl disable bluetooth.service
}

function f_tools_bluetooth_start {
    sudo systemctl start bluetooth.service
}

function f_tools_bluetooth_stop {
    sudo systemctl stop bluetooth.service
}

function f_tools_bluetooth {
    options=("Retour" "Bluetooth enable" "Bluetooth disable" "Bluetooth start" "Bluetooth stop")
    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                clear
                break
                ;;
            "Bluetooth enable")
                clear
                f_tools_bluetooth_enable
                break
                ;;
            "Bluetooth disable")
                clear
                f_tools_bluetooth_disable
                break
                ;;
            "Bluetooth start")
                clear
                f_tools_bluetooth_start
                break
                ;;
            "Bluetooth stop")
                clear
                f_tools_bluetooth_stop
                break
                ;;
        esac
    done
}
f_tools_bluetooth