#!/bin/bash
function f_tools_network_arp {
    sudo ip -s -s neigh flush all
    sleep 2s
    arp
}

function f_tools_network {
    options=("Retour" "IP réseau avec ARP")
    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                clear
                break
                ;;
            "IP réseau avec ARP")
                clear
                f_tools_network_arp
                break
                ;;
        esac
    done
}
f_tools_network