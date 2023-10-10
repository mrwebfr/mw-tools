#!/bin/bash

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

# Obtenir des informations sur l'adresse IP depuis ipinfo.io
json_data=$(curl -s "http://ipinfo.io/json")

# Afficher les informations pertinentes
echo ""

echo "CONNEXION :"
echo ""
echo "---------------------------------"
echo ""

org=$(echo "$json_data" | jq -r '.org')
[ ! -z "$org" ] && echo "Organisation : $org"

ip=$(echo "$json_data" | jq -r '.ip')
[ ! -z "$ip" ] && echo "Adresse IP : $ip"

country=$(echo "$json_data" | jq -r '.country')
[ ! -z "$country" ] && echo "Pays : $country"

echo ""

hostname=$(echo "$json_data" | jq -r '.hostname')
[ ! -z "$hostname" ] && echo "Nom d'hôte : $hostname"

city=$(echo "$json_data" | jq -r '.city')
[ ! -z "$city" ] && echo "Ville : $city"

region=$(echo "$json_data" | jq -r '.region')
[ ! -z "$region" ] && echo "Région : $region"

postal=$(echo "$json_data" | jq -r '.postal')
[ ! -z "$postal" ] && echo "Code Postal : $postal"

timezone=$(echo "$json_data" | jq -r '.timezone')
[ ! -z "$timezone" ] && echo "Fuseau Horaire : $timezone"

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
