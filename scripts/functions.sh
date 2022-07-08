#!/bin/bash

function dist_os() {
    if cat /etc/*release | grep ^NAME | grep Fedora; then
        OS="fedora"
    elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
        OS="ubuntu"
    elif cat /etc/*release | grep ^NAME | grep Debian; then
        OS="ubuntu"
    elif cat /etc/*release | grep ^NAME | grep Mint; then
        OS="ubuntu"
    else
        echo "OS Ubuntu/Fedora NOT DETECTED"
        read -e -i "" -p "Entrer pour continuer : " choice
    fi
    clear
}
dist_os

function banner() {
    local banner_path="$PWD/scripts/banner"
    if [ -f $banner_path ];then 
        clear && echo ""
        cat $banner_path
        echo ""
    else
        error "banner not Found..."
    fi
    unset banner_path
}

function run_script() {
    local script_path=$1
    local script_name=$2
    if [ -f "$PWD/$script_path" ];then
        chmod +x "$PWD/$script_path"
    else
        error "$PWD/$script_path not Found..."    
    fi
    source $PWD/$script_path
    unset script_path
}

function wait() {
    echo ""
    read -e -i "" -p "Entrer pour continuer : " choice
    # for (( i=0 ; i<5 ; i++ ));do
    #     echo -n "."
    #     sleep 1
    # done
    # echo ""
}

function error() {
    echo -e "\033[1;31merror:\e[0m $@"
    exit 1
}