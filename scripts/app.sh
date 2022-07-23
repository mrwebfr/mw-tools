#!/bin/bash
function f_install {

    source scripts/app/full.sh

PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Ubuntu Extras"
    "Fedora Extras"
    "Anydesk"
    # "Atom"
    "Audacity"
    "Bitwarden"
    "Capture Image/Vidéo"
    "Coolero"
    "Detwinner (Duplicate)"
    "Developpement"
    "Filezilla"
    "Github Desktop"
    "Hypnotix"
    "Krita"
    "LibreOffice"
    "Mainline Kernel"
    "Menu"
    "MediaInfo"
    "Navigateurs"
    "NextCloud Client"
    "OnlyOffice"
    "PDF"
    "Piper (souris)"
    "Plex Player"
    "ProtonVPN"
    "Shazam"
    "Skype"
    "SpeedTest"
    "Spotify"
    "Stacer"
    "Telegram"
    "Terminal"
    "Timeshift"
    "Torrent"
    # "Touchegg"
    "Uget"
    "VirtualBox"
    "Visual Studio Code"
    "VLC"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash setup.sh
                break
                ;;
            "Ubuntu Extras")
                clear && banner
                app_ubuntu
                break
                ;;
            "Fedora Extras")
                clear && banner
                app_fedora
                break
                ;;
            "Anydesk")
                clear && banner
                app_anydesk
                break
                ;;
            "Atom")
                clear && banner
                app_atom
                break
                ;;
            "Audacity")
                clear && banner
                app_audacity
                break
                ;;
            "Bitwarden")
                clear && banner
                app_bitwarden
                break
                ;;
            "Capture Image/Vidéo")
                clear && banner
                app_capture
                break
                ;;
            "Chrome / Chromium")
                clear && banner
                app_chromium
                break
                ;;
            "Coolero")
                clear && banner
                app_coolero
                break
                ;;
            "Detwinner (Duplicate)")
                clear && banner
                app_detwinner
                break
                ;;
            "Filezilla")
                clear && banner
                app_filezilla
                break
                ;;
            "Flameshot")
                clear && banner
                app_flameshot
                break
                ;;
            "Github Desktop")
                clear && banner
                app_git
                break
                ;;
            "Hypnotix")
                clear && banner
                app_hypnotix
                break
                ;;
            "Krita")
                clear && banner
                app_krita
                break
                ;;
            "LibreOffice")
                clear && banner
                app_libreoffice
                break
                ;;
            "Mainline Kernel")
                clear && banner
                app_mainline
                break
                ;;
            "Menu")
                clear && banner
                app_menulibre
                break
                ;;
            "MediaInfo")
                clear && banner
                app_mediainfo
                break
                ;;
            "Navigateurs")
                clear && banner
                app_nav
                break
                ;;
            "NextCloud Client")
                clear && banner
                app_nextcloud
                break
                ;;
            "OnlyOffice")
                clear && banner
                app_onlyoffice
                break
                ;;
            "Opera")
                clear && banner
                app_opera
                break
                ;;
            "PDF")
                clear && banner
                app_pdf
                break
                ;;
            "Piper (souris)")
                clear && banner
                app_piper
                break
                ;;
            "Plex Player")
                clear && banner
                app_plex
                break
                ;;
            "Developpement")
                clear && banner
                app_dev
                break
                ;;
            "ProtonVPN")
                clear && banner
                app_proton
                break
                ;;
            "SimpleScreenRecorder")
                clear && banner
                app_simplescreenrecorder
                break
                ;;
            "Skype")
                clear && banner
                app_skype
                break
                ;;
            "Shazam")
                clear && banner
                app_shazam
                break
                ;;
            "SpeedTest")
                clear && banner
                app_speedtest
                break
                ;;
            "Spotify")
                clear && banner
                app_spotify
                break
                ;;
            "Stacer")
                clear && banner
                app_stacer
                break
                ;;
            "Telegram")
                clear && banner
                app_telegram
                break
                ;;
            "Terminal")
                clear && banner
                app_term
                break
                ;;
            "Timeshift")
                clear && banner
                app_timeshift
                break
                ;;
            "Torrent")
                clear && banner
                app_torrent
                break
                ;;
            "Touchegg")
                clear && banner
                app_touchegg
                break
                ;;
            "Uget")
                clear && banner
                app_uget
                break
                ;;
            "VirtualBox")
                clear && banner
                app_virtualbox
                break
                ;;
            "Visual Studio Code")
                clear && banner
                app_vscode
                break
                ;;
            "VLC")
                clear && banner
                app_vlc
                break
                ;;
            # "Gnome extensions")
            #     sudo apt install -y gnome-shell-extension-dash-to-panel gnome-shell-extension-dashtodock gnome-shell-extension-remove-dropdown-arrows
            #     break
            #     ;;
        esac
    done
}

source scripts/functions.sh

clear && banner

f_install