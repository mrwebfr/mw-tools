#!/bin/bash
function apps {

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
    "Starship"
    "Teamviewer"
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
                bash_cmd_main
                ;;
            "Ubuntu Extras")
                banner
                app_ubuntu
                bash_cmd "apps"
                ;;
            "Fedora Extras")
                banner
                app_fedora
                bash_cmd "apps"
                ;;
            "Anydesk")
                banner
                app_anydesk
                bash_cmd "apps"
                ;;
            "Atom")
                banner
                app_atom
                bash_cmd "apps"
                ;;
            "Audacity")
                banner
                app_audacity
                bash_cmd "apps"
                ;;
            "Bitwarden")
                banner
                app_bitwarden
                bash_cmd "apps"
                ;;
            "Capture Image/Vidéo")
                banner
                app_capture
                bash_cmd "apps"
                ;;
            "Chrome / Chromium")
                banner
                app_chromium
                bash_cmd "apps"
                ;;
            "Coolero")
                banner
                app_coolero
                bash_cmd "apps"
                ;;
            "Detwinner (Duplicate)")
                banner
                app_detwinner
                bash_cmd "apps"
                ;;
            "Filezilla")
                banner
                app_filezilla
                bash_cmd "apps"
                ;;
            "Flameshot")
                banner
                app_flameshot
                bash_cmd "apps"
                ;;
            "Github Desktop")
                banner
                app_git
                bash_cmd "apps"
                ;;
            "Hypnotix")
                banner
                app_hypnotix
                bash_cmd "apps"
                ;;
            "Krita")
                banner
                app_krita
                bash_cmd "apps"
                ;;
            "LibreOffice")
                banner
                app_libreoffice
                bash_cmd "apps"
                ;;
            "Mainline Kernel")
                banner
                app_mainline
                bash_cmd "apps"
                ;;
            "Menu")
                banner
                app_menulibre
                bash_cmd "apps"
                ;;
            "MediaInfo")
                banner
                app_mediainfo
                bash_cmd "apps"
                ;;
            "Navigateurs")
                banner
                app_nav
                bash_cmd "apps"
                ;;
            "NextCloud Client")
                banner
                app_nextcloud
                bash_cmd "apps"
                ;;
            "OnlyOffice")
                banner
                app_onlyoffice
                bash_cmd "apps"
                ;;
            "Opera")
                banner
                app_opera
                bash_cmd "apps"
                ;;
            "PDF")
                banner
                app_pdf
                bash_cmd "apps"
                ;;
            "Piper (souris)")
                banner
                app_piper
                bash_cmd "apps"
                ;;
            "Plex Player")
                banner
                app_plex
                bash_cmd "apps"
                ;;
            "Developpement")
                banner
                app_dev
                bash_cmd "apps"
                ;;
            "ProtonVPN")
                banner
                app_proton
                bash_cmd "apps"
                ;;
            "SimpleScreenRecorder")
                banner
                app_simplescreenrecorder
                bash_cmd "apps"
                ;;
            "Skype")
                banner
                app_skype
                bash_cmd "apps"
                ;;
            "Shazam")
                banner
                app_shazam
                bash_cmd "apps"
                ;;
            "SpeedTest")
                banner
                app_speedtest
                bash_cmd "apps"
                ;;
            "Spotify")
                banner
                app_spotify
                bash_cmd "apps"
                ;;
            "Stacer")
                banner
                app_stacer
                bash_cmd "apps"
                ;;
            "Starship")
                banner
                app_starship
                bash_cmd "apps"
                ;;
            "Teamviewer")
                banner
                app_teamviewer
                bash_cmd "apps"
                ;;
            "Telegram")
                banner
                app_telegram
                bash_cmd "apps"
                ;;
            "Terminal")
                banner
                app_term
                bash_cmd "apps"
                ;;
            "Timeshift")
                banner
                app_timeshift
                bash_cmd "apps"
                ;;
            "Torrent")
                banner
                app_torrent
                bash_cmd "apps"
                ;;
            "Touchegg")
                banner
                app_touchegg
                bash_cmd "apps"
                ;;
            "Uget")
                banner
                app_uget
                bash_cmd "apps"
                ;;
            "VirtualBox")
                banner
                app_virtualbox
                bash_cmd "apps"
                ;;
            "Visual Studio Code")
                banner
                app_vscode
                bash_cmd "apps"
                ;;
            "VLC")
                banner
                app_vlc
                bash_cmd "apps"
                ;;
            # "Gnome extensions")
            #     sudo apt install -y gnome-shell-extension-dash-to-panel gnome-shell-extension-dashtodock gnome-shell-extension-remove-dropdown-arrows
            #     break
            #     ;;
        esac
    done
}