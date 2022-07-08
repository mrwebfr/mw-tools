#!/bin/bash
function theme_install_flat-remix {
    sudo rm -rf /tmp/themes
    mkdir -p /tmp/themes

    git clone https://github.com/daniruiz/flat-remix-gnome.git /tmp/themes/flat-remix-gnome/
    git clone https://github.com/daniruiz/flat-remix-gtk.git /tmp/themes/flat-remix-gtk/

    flatpak override --user --filesystem=xdg-config/gtk-4.0 --filesystem=home/.themes/

    FILE=/tmp/themes/flat-remix-gtk/
    if [ -d "$FILE" ]; then

        sudo rm -rf /usr/share/themes/Flat-Remix*
        mkdir -p ~/.themes
        rm -rf ~/.themes/Flat-Remix*
        # rm -rf ~/.themes/.config/gtk-4.0/*

        directory=~/.themes/
        # directory=/usr/share/themes/

        # cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-LibAdwaita-Blue-Dark/* ~/.config/gtk-4.0/

        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Blue-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Blue-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Brown-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Brown-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Cyan-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Cyan-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Green-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Green-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Grey-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Grey-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Magenta-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Magenta-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Orange-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Orange-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Red-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Red-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Teal-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Teal-Light $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Violet-Dark $directory
        sudo cp -r /tmp/themes/flat-remix-gtk/themes/Flat-Remix-GTK-Violet-Light $directory

        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Blue-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Blue-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Brown-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Brown-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Cyan-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Cyan-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Green-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Green-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Grey-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Grey-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Magenta-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Magenta-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Orange-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Orange-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Red-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Red-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Teal-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Teal-Light-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Violet-Dark-fullPanel $directory
        sudo cp -r /tmp/themes/flat-remix-gnome/themes/Flat-Remix-Violet-Light-fullPanel $directory

        # gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Blue-Dark"

        sudo chown -R $(id -u):$(id -g) $HOME/.themes

    else
        echo "Il y a un problème !"
    fi
}

#######################################################################################

function theme_remove_flat-remix {
    rm -rf ~/.themes/Flat-Remix*
    sudo rm -rf /usr/share/themes/Flat-Remix*
    # rm -rf ~/.themes/.config/gtk-4.0/gtk.css
    # rm -rf ~/.themes/.config/gtk-4.0/assets
}

function theme_flat-remix {
    source scripts/functions.sh
    clear && banner
    
    PS3='
Veuillez faire un choix : '

    options=(
    "Quitter"
    "Installer / Mise à jour"
    "Supprimer"
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "Quitter")
                bash setup.sh
                break
                ;;
            "Installer / Mise à jour")
                clear
                theme_install_flat-remix
                break
                ;;
            "Supprimer")
                clear
                theme_remove_flat-remix
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

theme_flat-remix
