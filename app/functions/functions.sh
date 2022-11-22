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
    clear
    local banner_path="$PWD/app/banner"
    if [ -f $banner_path ];then 
        clear && echo ""
        cat $banner_path
        echo ""
    else
        error "banner not Found..."
    fi
    unset banner_path
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

function bash_cmd() {
    clear
    banner
    $1
    wait
    clear
    banner
    main
}

function bash_cmd_main() {
    clear
    banner
    main
}