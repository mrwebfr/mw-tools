#!/bin/bash
function sgc {
    PS3='
Veuillez faire un choix : '
    options=(
        "Retour"
        "keybindings Dump"
        "keybindings Load"
        "Tilix Dump"
        "Tilix Load"
        "LibreOffice Flatpak Launcher light"
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd_main
                ;;
            "keybindings Dump")
                banner
                mkdir ~/.mw_tools
                mkdir ~/.mw_tools/keybindings
                rm -r ~/.mw_tools/keybindings/*
                clear
                dconf dump /org/gnome/desktop/wm/keybindings/ > ~/.mw_tools/keybindings/wm-keybindings.dconf.bak
                dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > ~/.mw_tools/keybindings/media-keys-keybindings.dconf.bak
                wait
                bash_cmd "sgc"
                ;;
            "keybindings Load")
                banner
                dconf load /org/gnome/desktop/wm/keybindings/ < /tmp/mw_tools/ressources/keybindings/wm-keybindings.dconf.bak
                dconf load /org/gnome/settings-daemon/plugins/media-keys/ < /tmp/mw_tools/ressources/keybindings/media-keys-keybindings.dconf.bak
                wait
                bash_cmd "sgc"
                ;;
            "Tilix Dump")
                banner
                mkdir ~/.mw_tools
                mkdir ~/.mw_tools/config
                rm -r ~/.mw_tools/config/*
                clear
                dconf dump /com/gexperts/Tilix/ > ~/.mw_tools/config/tilix.dconf.bak
                wait
                bash_cmd "sgc"
                ;;
            "Tilix Load")
                banner
                dconf load /com/gexperts/Tilix/ < /tmp/mw_tools/ressources/configs/tilix.dconf.bak
                wait
                bash_cmd "sgc"
                ;;
            "LibreOffice Flatpak Launcher light")
                banner
                cp /tmp/mw_tools/ressources/applications/org.libreoffice* ~/.local/share/applications
                wait
                bash_cmd "sgc"
                ;;
        esac
    done
}