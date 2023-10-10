#!/bin/bash

function ip {
    # Vérifier si curl est installé, sinon l'installer
    if ! command -v curl &> /dev/null; then
        echo "curl n'est pas installé."
        sudo apt update && sudo apt install curl
    fi
    
    # Vérifier et installer fast-cli si nécessaire
    if ! command -v fast &> /dev/null; then
        echo "fast-cli n'est pas installé."
        sudo snap install fast
    fi
    
    # Afficher les informations pertinentes
    echo ""
    
    echo "CONNEXION :"
    echo ""
    echo "---------------------------------"
    echo ""
    
    curl -s "https://ip.mrweb.fr/?v=ip,country,city,code,continent,fai"
    
    echo ""
    echo ""
    echo "---------------------------------"
    echo ""
    
    # Effectuer un test de vitesse avec fast.com
    fast
    
    echo ""
    echo "---------------------------------"
    echo ""
    
    # Effectuer un test de ping vers Google DNS
    
    ping -c 4 1.1.1.1
    
    echo ""
    echo ""
}
