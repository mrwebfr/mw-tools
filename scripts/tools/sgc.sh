#!/bin/bash
function f_tools_sgc {

PS3='
Veuillez faire un choix : '
options=(
"Retour"
"Themes"
"keybindings Dump"
"keybindings Load"
"Terminal par défaut"
"Tilix Dump"
"Tilix Load"
"LibreOffice Flatpak Launcher light"
# "Backgrounds"
# "Firefox Launcher light"
# "Firefox-trunk Launcher light"
# "Supprimer Imprimante cups-browsed"
)
select opt in "${options[@]}"
do
    case $opt in
        "Retour")
            break
            ;;
        "Themes")
            clear
            mkdir ~/.mw_tools
            rm -r ~/.mw_tools/themes
            clear
            cp -r /tmp/mw_tools/ressources/scripts/themes ~/.mw_tools/themes
            chmod +x ~/.mw_tools/themes/*
            break
            ;;
        "keybindings Dump")
            clear
            mkdir ~/.mw_tools
            mkdir ~/.mw_tools/keybindings
            rm -r ~/.mw_tools/keybindings/*
            clear
            dconf dump /org/gnome/desktop/wm/keybindings/ > ~/.mw_tools/keybindings/wm-keybindings.dconf.bak
            dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > ~/.mw_tools/keybindings/media-keys-keybindings.dconf.bak
            break
            ;;
        "keybindings Load")
            clear
            dconf load /org/gnome/desktop/wm/keybindings/ < /tmp/mw_tools/ressources/scripts/keybindings/wm-keybindings.dconf.bak
            dconf load /org/gnome/settings-daemon/plugins/media-keys/ < /tmp/mw_tools/ressources/scripts/keybindings/media-keys-keybindings.dconf.bak
            break
            ;;
        "Terminal par défaut")
            clear
            sudo update-alternatives --config x-terminal-emulator
            break
            ;;
        "Tilix Dump")
            clear
            mkdir ~/.mw_tools
            mkdir ~/.mw_tools/config
            rm -r ~/.mw_tools/config/*
            clear
            dconf dump /com/gexperts/Tilix/ > ~/.mw_tools/config/tilix.dconf.bak
            break
            ;;
        "Tilix Load")
            clear
            dconf load /com/gexperts/Tilix/ < /tmp/mw_tools/ressources/scripts/configs/tilix.dconf.bak
            break
            ;;
        "LibreOffice Flatpak Launcher light")
            clear
            cp /tmp/mw_tools/ressources/applications/org.libreoffice* ~/.local/share/applications
            break
            ;;
        # "Backgrounds")
        #     clear
        #     mkdir ~/.mw_tools
        #     rm -r ~/.mw_tools/Backgrounds*
        #     clear
        #     cd ~/.mw_tools
        #     wget https://github.com/mrwebfr/mw-tools/releases/download/1.0.0/Backgrounds.zip
        #     unzip Backgrounds.zip
        #     rm Backgrounds.zip
        #     break
        #     ;;
        # "Firefox Launcher light")
        #     clear
        #     cp /tmp/mw_tools/ressources/applications/firefox.d* ~/.local/share/applications
        #     break
        #     ;;
        # "Firefox-trunk Launcher light")
        #     clear
        #     cp /tmp/mw_tools/ressources/applications/firefox-trunk* ~/.local/share/applications
        #     break
        #     ;;
        # "Supprimer Imprimante cups-browsed")
        #     clear
        #     sudo apt-get purge --autoremove cups-browsed
        #     break
        #     ;;
    esac
done

}
