#!/bin/bash
function f_tools_network_arp {
    sudo ip -s -s neigh flush all
}
function f_tools_network_arp2 {
    sudo arp
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
                f_tools_network_arp2
                break
                ;;
        esac
    done
}
f_tools_network