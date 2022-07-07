#!/bin/bash

function clean {
    source scripts/functions.sh
    clear && banner
    
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Nettoyage complet"
    "Purger configuration inutile DPKG"
    "Purge journaux /var"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                break
                ;;
            "Nettoyage complet")
                clear
                clean_full
                break
                ;;
            "Purger configuration inutile DPKG")
                clear
                clean_dpkg
                break
                ;;
            "Purge journaux /var")
                clear
                clean_var
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

function clean_full {

    if [ "$OS" == "ubuntu" ]; then
        sudo apt remove popularity-contest -y
        # Clean Ubuntu
        if ! dpkg -s 'trash-cli' >/dev/null 2>&1; then
            sudo apt install trash-cli -y
        fi
        trash-empty
        rm -r -f ~/.local/share/Trash/files/*
        sudo apt-get autoremove -y
        sudo apt-get clean -y
        sudo apt-get autoclean -y
        # sudo apt --purge autoremove -y
        # sudo aptitude purge ~c -y
        find ~/.thumbnails -type f -atime +1 | xargs rm -rf;
        find ~/ -type d -iname 'cache' | xargs rm -rf;
        find ~/.var -type d -iname '.cache' | xargs rm -rf;
        find ~/snap -type d -iname '.cache' | xargs rm -rf;
        find ~/.cache/* -maxdepth 1 ! -name 'pvpn*' ! -name 'proton*' | xargs rm -rf;
        find ~/ -type d -iname 'caches' | xargs rm -rf;
        find ~/ -type d -iname '.caches' | xargs rm -rf;
        find ~/ -type d -iname 'media_cache' | xargs rm -rf;
        find ~/ -type d -iname '.DS_Store' | xargs rm -rf;
        find ~/.config/ -type d -empty -delete
        find ~/ -type d -iname '*~' | xargs rm -rf;
        # find ~/ -name '*~' -print0 | xargs rm -Rf
        flatpak uninstall --unused
        flatpak uninstall --delete-data -y
        # sudo rm -rf /tmp/*
        # find ~/ -type d \( ! -name .protonvpn-cli \) -prune -o -name '*~' | xargs rm -rf;
        mwmessage="Le PC est propre. "

    elif [ "$OS" == "fedora" ]; then
        
        # Clean Fedora
        if ! rpm -qa | grep 'trash-cli' >/dev/null 2>&1; then
            sudo dnf install trash-cli -y
        fi

        trash-empty
        rm -r -f ~/.local/share/Trash/files/*
        sudo dnf autoremove -y
        sudo dnf clean all -y
        find ~/.thumbnails -type f -atime +1 | xargs rm -rf;
        find ~/ -type d -iname 'cache' | xargs rm -rf;
        find ~/.var -type d -iname '.cache' | xargs rm -rf;
        find ~/snap -type d -iname '.cache' | xargs rm -rf;
        find ~/ -type d -iname 'caches' | xargs rm -rf;
        find ~/ -type d -iname '.caches' | xargs rm -rf;
        find ~/ -type d -iname 'media_cache' | xargs rm -rf;
        find ~/ -type d -iname '.DS_Store' | xargs rm -rf;
        find ~/.config/ -type d -empty -delete
        find ~/ -type d -iname '*~' | xargs rm -rf;
        # find ~/ -name '*~' -print0 | xargs rm -Rf
        flatpak uninstall --unused
        flatpak uninstall --delete-data -y
        mwmessage="Le PC est propre. "

    fi

}

####################
# Clean 2
####################
function clean_dpkg {

if [ "$OS" == "ubuntu" ]; then
    echo "
    ---

    => Ne pas faire attention à : 'dpkg: erreur'
    => C'est qu'il n'y a rien à supprimer ...

    ---
    "
    sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2)

    elif [ "$OS" == "fedora" ]; then

    echo "
    ---

    => Option non prévu pour Fedora

    ---
    "
fi

}

function clean_var {
    sudo echo "" > /var/log/syslog
    sudo find /var/log -type f -regex ".*\.gz$" | sudo xargs rm -Rf
    sudo find /var/log -type f -regex ".*\.[0-9]$" | sudo xargs rm -Rf
    sudo find /var/log -type f -regex ".*\.old$" | sudo xargs rm -Rf
    sudo rm -rf /var/crash/*
    if [ "$OS" == "ubuntu" ]; then
        sudo rm /var/cache/apt/archives/*.deb
    fi
}

source scripts/functions.sh

clear && banner

clean

wait_second 5

bash setup.sh