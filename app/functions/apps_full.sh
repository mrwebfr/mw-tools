#!/bin/bash

##############################
# Fedora
##############################
function app_ubuntu {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Paquets utiles - [Ubuntu]"
    "Gnome Software + Flatpak - [Ubuntu]"
    "Flatpak Beta - [Ubuntu]"
    "Snap Store - Supprimer [Snap]"
    # "Compatibilités médias - [Ubuntu]"
    "Codecs multimédias essentiels - [Ubuntu]"
    "Microsoft fonts - [Ubuntu]"
    "Fonts Microsoft & Apple - [GitHub]"
    "VMware - [Ubuntu]"
    "Pilotes Nvidia PPA (ATTENTION !) - [Ubuntu]"
    "ZRam - [Ubuntu]"
    # "EarlyOOM (Ram) - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Paquets utiles - [Ubuntu]")
                sudo apt install git subversion rar bmon htop curl gnome-tweaks dfc ncdu wavemon xdotool
                wait
                bash_cmd "apps"
                ;;
            "Compatibilités médias - [Ubuntu]")
                sudo apt install heif-gdk-pixbuf heif-thumbnailer
                wait
                bash_cmd "apps"
                ;;
            "VMware - [Ubuntu]")
                sudo apt install gcc build-essential
                xdg-open https://www.vmware.com/fr/products/workstation-player/workstation-player-evaluation.html
                wait
                bash_cmd "apps"
                ;;
            "Gnome Software + Flatpak - [Ubuntu]")
                sudo apt install gnome-software
                sudo apt install -y flatpak gnome-software-plugin-flatpak
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                flatpak update --appstream
                killall gnome-software
                wait
                bash_cmd "apps"
                ;;
            "Snap Store - Supprimer [Snap]")
                sudo snap remove snap-store
                wait
                bash_cmd "apps"
                ;;
            # "Flatpak - [Ubuntu]")
            #     sudo apt install -y flatpak gnome-software-plugin-flatpak
            #     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            #     flatpak update --appstream
            #     wait
            #     bash_cmd "apps"
            #     break
            #     ;;
            "Flatpak Beta - [Ubuntu]")
                flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
                flatpak update --appstream
                wait
                bash_cmd "apps"
                ;;
            "Pilotes Nvidia PPA (ATTENTION !) - [Ubuntu]")
                sudo add-apt-repository ppa:graphics-drivers/ppa
                sudo apt update
                wait
                bash_cmd "apps"
                ;;
            "ZRam - [Ubuntu]")
                sudo apt-get install zram-config
                sudo service zram-config start
                echo '
-----------------------------------------
    sudo nano /usr/bin/init-zram-swapping
    mem=$((totalmem / 2 * 1024))
    à
    mem=$((totalmem * 2 * 1024))
-----------------------------------------
'
                wait
                bash_cmd "apps"
                ;;
            "Codecs multimédias essentiels - [Ubuntu]")
                sudo add-apt-repository multiverse
                sudo apt install ubuntu-restricted-extras
                wait
                bash_cmd "apps"
                ;;
            "Microsoft fonts - [Ubuntu]")
                sudo add-apt-repository multiverse
                sudo apt update && sudo apt install ttf-mscorefonts-installer
                sudo fc-cache -f -v
                wait
                bash_cmd "apps"
                ;;
            "Fonts Microsoft & Apple - [GitHub]")
                sudo rm -r /usr/share/fonts/mw_fonts
                cd /tmp/mw_tools/
                wget https://github.com/mrwebfr/mw-tools/releases/download/1.0.0/mw_fonts.zip
                unzip mw_fonts.zip
                rm mw_fonts.zip
                sudo mv /tmp/mw_tools/mw_fonts /usr/share/fonts/mw_fonts
                wait
                bash_cmd "apps"
                ;;
            # "EarlyOOM (Ram) - [Ubuntu]")
            #     sudo apt install earlyoom
            #     wait
            #     bash_cmd "apps"
            #     break
            #     ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}


##############################
# Fedora
##############################
function app_fedora {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Paquets utiles - [Fedora]"
    "Flatpak - [Fedora]"
    "Flatpak Beta - [Fedora]"
    "Snap - [Fedora]"
    "RPMFusion Free - [Fedora]"
    "RPMFusion Non-Free - [Fedora]"
    "Codecs multimédias - [Fedora]"
    "NCDU (disk space) - [Fedora]"
    "Microsoft fonts - [Fedora DNF]"
    "Fonts Microsoft & Apple - [GitHub]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Paquets utiles - [Fedora]")
                sudo dnf install git subversion rar bmon htop curl gnome-tweaks dfc ncdu wavemon
                wait
                bash_cmd "apps"
                ;;
            "Flatpak - [Fedora]")
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                flatpak update --appstream
                wait
                bash_cmd "apps"
                ;;
            "Flatpak Beta - [Fedora]")
                flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
                flatpak update --appstream
                wait
                bash_cmd "apps"
                ;;
            "Snap - [Fedora]")
                app_snap
                wait
                bash_cmd "apps"
                ;;
            "RPMFusion Free - [Fedora]")
                sudo dnf install --nogpgcheck https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
                sudo dnf update
                sudo dnf install rpmfusion-free-appstream-data
                wait
                bash_cmd "apps"
                ;;
            "RPMFusion Non-Free - [Fedora]")
                sudo dnf install --nogpgcheck https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
                sudo dnf update
                sudo dnf install rpmfusion-nonfree-appstream-data
                wait
                bash_cmd "apps"
                ;;
            "Codecs multimédias - [Fedora]")
                sudo dnf install gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly
                sudo dnf install gstreamer1-plugins-{base,good,bad-free,good-extras,bad-free-extras} gstreamer1-plugin-mpg123
                sudo dnf install gstreamer1-libav gstreamer1-plugins-{bad-freeworld,ugly}
                wait
                bash_cmd "apps"
                ;;
            "NCDU (disk space) - [Fedora]")
                sudo dnf install ncdu
                wait
                bash_cmd "apps"
                ;;
            "Microsoft fonts - [Fedora DNF]")
                sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
                sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
                wait
                bash_cmd "apps"
                ;;
            "Fonts Microsoft & Apple - [GitHub]")
                sudo rm -r /usr/share/fonts/mw_fonts
                cd /tmp/mw_tools/
                wget https://github.com/mrwebfr/mw-tools/releases/download/1.0.0/mw_fonts.zip
                unzip mw_fonts.zip
                rm mw_fonts.zip
                sudo mv /tmp/mw_tools/mw_fonts /usr/share/fonts/mw_fonts
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Snap
##############################
function app_snap {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Snap - [Fedora]"
    "Snap store - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Snap - [Fedora]")
                sudo dnf install snapd
                sudo ln -s /var/lib/snapd/snap /snap
                wait
                bash_cmd "apps"
                ;;
            "Snap store - [Snap]")
                sudo snap install snap-store
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Flash Player
##############################
function app_adobe-flashplugin {
echo "
ATTENTION ! Adobe Flash c'est de la marde ...
Pour supprimer : sudo apt autoremove adobe-flashplugin
"
PS3='
Veuillez faire un choix : '
options=(
"Retour"
"Flash Player - [Ubuntu]"
)

select opt in "${options[@]}"
do
    case $opt in
        "Retour")
            clear
            bash_cmd "apps"
            break
            ;;
        "Flash Player - [Ubuntu]")
            clear
            sudo apt install adobe-flashplugin
            wait
            bash_cmd "apps"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

##############################
# Anydesk
##############################
function app_anydesk {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Anydesk - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Anydesk - [Flatpak]")
                flatpak install flathub com.anydesk.Anydesk
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Atom
##############################
function app_atom {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Atom - [Flatpak]"
    "Atom - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Atom - [Flatpak]")
                flatpak install io.atom.Atom
                wait
                bash_cmd "apps"
                ;;
            "Atom - [Snap]")
                sudo snap install atom --classic
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Audacity
##############################
function app_audacity {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Audacity - [Flatpak]"
    "Audacity - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Audacity - [Flatpak]")
                flatpak install flathub org.audacityteam.Audacity
                wait
                bash_cmd "apps"
                ;;
            "Audacity - [Snap]")
                sudo snap install audacity
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Bitwarden
##############################
function app_bitwarden {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Bitwarden - [Flatpak]"
    "Bitwarden - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Bitwarden - [Flatpak]")
                flatpak install com.bitwarden.desktop
                wait
                bash_cmd "apps"
                ;;
            "Bitwarden - [Snap]")
                sudo snap install bitwarden
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Captures
##############################
function app_capture {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Flameshot - [Flatpak]"
    "Flameshot - [Ubuntu]"
    "Flameshot - [Fedora]"
    "SimpleScreenRecorder - [Snap]"
    "Kooha - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Flameshot - [Flatpak]")
                flatpak install flathub org.flameshot.Flameshot
                wait
                bash_cmd "apps"
                ;;
            "Flameshot - [Ubuntu]")
                sudo apt install flameshot
                wait
                bash_cmd "apps"
                ;;
            "Flameshot - [Fedora]")
                sudo dnf install flameshot
                wait
                bash_cmd "apps"
                ;;
            "Flameshot - [Snap]")
                sudo snap install flameshot
                wait
                bash_cmd "apps"
                ;;
            "Flameshot - [Flatpak]")
                flatpak install flathub org.flameshot.Flameshot
                wait
                bash_cmd "apps"
                ;;
            "SimpleScreenRecorder - [Snap]")
                sudo snap install simplescreenrecorder
                wait
                bash_cmd "apps"
                ;;
            "Kooha - [Flatpak]")
                flatpak install flathub io.github.seadve.Kooha
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Coolero
##############################
function app_coolero {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Coolero - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Coolero - [Flatpak]")
                flatpak install flathub org.coolero.Coolero
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Detwinner
##############################
function app_detwinner {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Detwinner (Duplicate) - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Detwinner (Duplicate) - [Flatpak]")
                flatpak install flathub com.neatdecisions.Detwinner
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Filezilla
##############################
function app_filezilla {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Filezilla - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Filezilla - [Flatpak]")
                flatpak install flathub org.filezillaproject.Filezilla
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Firefox
##############################
function app_nav {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Firefox - [Snap]"
    "Firefox Beta - [Snap]"
    "Firefox Nightly- [Snap]"
    "Firefox - [Flatpak]"
    "Firefox Beta - [Flatpak]"
    "Brave - [Flatpak]"
    "Brave - [Snap]"
    "Chrome - [Flatpak]"
    "Chromium - [Snap]"
    "Chromium - [Flatpak]"
    "Opera - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Firefox - [Snap]")
                sudo snap install firefox
                wait
                bash_cmd "apps"
                ;;
            "Firefox Beta - [Snap]")
                sudo snap install firefox --beta
                wait
                bash_cmd "apps"
                ;;
            "Firefox Nightly- [Snap]")
                sudo snap install firefox --edge
                wait
                bash_cmd "apps"
                ;;
            "Firefox - [Flatpak]")
                flatpak install flathub org.mozilla.firefox
                wait
                bash_cmd "apps"
                ;;
            "Firefox Beta - [Flatpak]")
                flatpak install --user https://flathub.org/beta-repo/appstream/org.mozilla.firefox.flatpakref
                wait
                bash_cmd "apps"
                ;;
            "Brave - [Flatpak]")
                flatpak install flathub com.brave.Browser
                wait
                bash_cmd "apps"
                ;;
            "Brave - [Snap]")
                sudo snap install brave
                wait
                bash_cmd "apps"
                ;;
            "Chrome - [Flatpak]")
                flatpak install flathub com.google.Chrome
                wait
                bash_cmd "apps"
                ;;
            "Chromium - [Snap]")
                sudo snap install chromium
                wait
                bash_cmd "apps"
                ;;
            "Chromium - [Flatpak]")
                flatpak install flathub org.chromium.Chromium
                wait
                bash_cmd "apps"
                ;;
            "Opera - [Snap]")
                sudo snap install opera
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Github Desktop
##############################
function app_git {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Github Desktop - [Flatpak]"
    "Github Desktop - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Github Desktop - [Flatpak]")
                flatpak install flathub io.github.shiftey.Desktop
                wait
                bash_cmd "apps"
                ;;
            "Github Desktop - [URL]")
                xdg-open https://github.com/shiftkey/desktop
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Hypnotix
##############################
function app_hypnotix {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Installer Hypnotix - [APT Mint]"
    "Supprimer Hypnotix - [APT Mint]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Installer Hypnotix - [APT Mint]")
                sudo add-apt-repository ppa:kelebek333/mint-tools
                sudo apt install hypnotix
                wait
                bash_cmd "apps"
                ;;
            "Supprimer Hypnotix - [APT Mint]")
                sudo apt autoremove --purge hypnotix
                sudo add-apt-repository --remove ppa:kelebek333/mint-tools
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Krita
##############################
function app_krita {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Krita - [Flatpak]"
    "Krita - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Krita - [Flatpak]")
                flatpak install flathub org.kde.krita
                wait
                bash_cmd "apps"
                ;;
            "Krita - [Snap]")
                sudo snap install krita
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# LibreOffice
##############################
function app_libreoffice {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "LibreOffice - [Flatpak]"
    "LibreOffice - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "LibreOffice - [Flatpak]")
                flatpak install flathub org.libreoffice.LibreOffice
                wait
                bash_cmd "apps"
                ;;
            "LibreOffice - [Snap]")
                sudo snap install libreoffice
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Mainline
##############################
function app_mainline {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Mainline Kernel - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Mainline Kernel - [Ubuntu]")
                sudo add-apt-repository ppa:cappelikan/ppa
            	sudo apt update
            	sudo apt install mainline
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# MediaInfo
##############################
function app_mediainfo {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "MediaInfo - [Flatpak]"
    "MediaInfo - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "MediaInfo - [Flatpak]")
                flatpak install flathub net.mediaarea.MediaInfo
                wait
                bash_cmd "apps"
                ;;
            "MediaInfo - [Snap]")
                sudo snap install mediainfo
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Menu
##############################
function app_menulibre {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "AppEditor - [Flatpak]"
    "MenuLibre - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "AppEditor - [Flatpak]")
                flatpak install flathub com.github.donadigo.appeditor
                wait
                bash_cmd "apps"
                ;;
            "MenuLibre - [Ubuntu]")
                sudo apt install menulibre
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# NextCloud
##############################
function app_nextcloud {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "NextCloud Client - [Flatpak]"
    "NextCloud Client Dev - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "NextCloud Client - [Flatpak]")
                flatpak install flathub org.nextcloud.Nextcloud
                #flatpak override --user --own-name=org.kde.* org.nextcloud.Nextcloud
                wait
                bash_cmd "apps"
                ;;
            "NextCloud Client Dev - [Ubuntu]")
                sudo add-apt-repository ppa:nextcloud-devs/client
                sudo apt update
                sudo apt install nextcloud-client nextcloud-client-nautilus nautilus-nextcloud
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# OnlyOffice
##############################
function app_onlyoffice {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "OnlyOffice - [Snap]"
    "OnlyOffice - [Flatpak] (Polices manquantes)"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "OnlyOffice - [Snap]")
                sudo snap install onlyoffice-desktopeditors
                wait
                bash_cmd "apps"
                ;;
            "OnlyOffice - [Flatpak] (Polices manquantes)")
                flatpak install org.onlyoffice.desktopeditors
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# PDF
##############################
function app_pdf {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "PDF Arranger - [Flatpak]"
    "PDF Mix Tool - [Flatpak]"
    "PDF Mix Tool - [Snap]"
    "PDF Okular - [Flatpak]"
    "PDF Okular - [Snap]"
    "PDF Slicer - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "PDF Arranger - [Flatpak]")
                flatpak install flathub com.github.jeromerobert.pdfarranger
                wait
                bash_cmd "apps"
                ;;
            "PDF Mix Tool - [Flatpak]")
                flatpak install flathub eu.scarpetta.PDFMixTool
                wait
                bash_cmd "apps"
                ;;
            "PDF Mix Tool - [Snap]")
                sudo snap install pdfmixtool
                wait
                bash_cmd "apps"
                ;;
            "PDF Okular - [Flatpak]")
                flatpak install org.kde.okular
                wait
                bash_cmd "apps"
                ;;
            "PDF Okular - [Snap]")
                sudo snap install okular
                wait
                bash_cmd "apps"
                ;;
            "PDF Slicer - [Flatpak]")
                flatpak install flathub com.github.junrrein.PDFSlicer
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Piper
##############################
function app_piper {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Piper - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Piper - [Flatpak]")
                flatpak install flathub org.freedesktop.Piper
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Plex
##############################
function app_plex {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Plex Player - [Flatpak]"
    "Plex Player - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Plex Player - [Flatpak]")
                flatpak install flathub tv.plex.PlexDesktop
                wait
                bash_cmd "apps"
                ;;
            "Plex Player - [URL]")
                xdg-open https://knapsu.eu/plex/
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Proton
##############################
function app_proton {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "ProtonVPN - [URL]"
    "Désinstaller ProtonVPN PIP3 - [Ubuntu]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "ProtonVPN - [URL]")
                xdg-open https://protonvpn.com/support/official-linux-client/
                xdg-open https://protonvpn.com/support/knowledge-base/official-linux-client
                wait
                bash_cmd "apps"
                ;;
            # "ProtonVPN - [Fedora]")
            #     sudo wget -q -O - https://repo.protonvpn.com/debian/public_key.asc | sudo apt-key add - && sudo add-apt-repository 'deb [arch=amd64] https://repo.protonvpn.com/debian unstable main'
            #     sudo apt-get update && sudo apt-get install protonvpn
            #     wait
            # bash_cmd "apps"
            # break
            #     ;;
            "Désinstaller ProtonVPN PIP3 - [Ubuntu]")
                sudo pip3 uninstall protonvpn-cli
                sudo apt autoremove --purge dialog python3-pip python3-setuptools
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done

}

##############################
# Sass
##############################
function app_dev {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "PO Poedit - [Flatpak]"
    "PO Gtranslator- [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "PO Poedit - [Flatpak]")
                flatpak install flathub net.poedit.Poedit
                wait
                bash_cmd "apps"
                ;;
            "PO Gtranslator- [Flatpak]")
                flatpak install flathub org.gnome.Gtranslator
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Shazam
##############################
function app_shazam {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Mousai - [Flatpak]"
    "SongRec - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Mousai - [Flatpak]")
                flatpak install flathub io.github.seadve.Mousai
                wait
                bash_cmd "apps"
                ;;
            "SongRec - [Flatpak]")
                flatpak install flathub com.github.marinm.songrec
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Skype
##############################
function app_skype {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Skype - [Flatpak]"
    "Skype - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Skype - [Flatpak]")
                flatpak install flathub com.skype.Client
                wait
                bash_cmd "apps"
                ;;
            "Skype - [Snap]")
                sudo snap install skype --classic
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# SpeedTest
##############################
function app_speedtest {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "SpeedTest - [Ubuntu]"
    "SpeedTest - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "SpeedTest - [Ubuntu]")
                sudo apt-get install curl
                curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
                sudo apt-get install speedtest
                wait
                bash_cmd "apps"
                ;;
            "SpeedTest - [Fedora]")
                curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
                sudo yum install SpeedTest
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Starship
##############################
function app_starship {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Starship - [URL]"
    "Copier la config"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Starship - [URL]")
                xdg-open https://snapcraft.io/starship
                wait
                bash_cmd "apps"
                ;;
            "Copier la config")
                cp /tmp/mw_tools/ressources/scripts/starship.toml ~/.config/starship.toml
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Spotify
##############################
function app_spotify {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Spotify - [Flatpak]"
    "Spotify - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Spotify - [Flatpak]")
                flatpak install com.spotify.Client
                wait
                bash_cmd "apps"
                ;;
            "Spotify - [Snap]")
                sudo snap install spotify
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Stacer
##############################
function app_stacer {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Stacer - [Ubuntu]"
    "Stacer - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Stacer - [Ubuntu]")
                sudo apt install stacer
                wait
                bash_cmd "apps"
                ;;
            "Stacer - [Fedora]")
                sudo dnf install stacer
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Teamviewer
##############################
function app_teamviewer {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Teamviewer Installation - [DEB]"
    "Teamviewer Désinstallation - [DEB]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Teamviewer Installation - [DEB]")
                cd /tmp
                wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
                sudo apt install ./teamviewer_amd64.deb
                rm teamviewer_amd64.deb
                cd /tmp/mw_tools/
                wait
                bash_cmd "apps"
                ;;
            "Teamviewer Désinstallation - [DEB]")
                sudo apt autoremove --purge teamviewer
                sudo rm -rf /etc/apt/sources.list.d/teamviewer*
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Telegram
##############################
function app_telegram {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Telegram - [Flatpak]"
    "Telegram - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Telegram - [Flatpak]")
                flatpak install org.telegram.desktop
                wait
                bash_cmd "apps"
                ;;
            "Telegram - [Snap]")
                sudo snap install telegram-desktop
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Terminal
##############################
function app_term {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Guake (Xorg) - [Ubuntu]"
    "Tilix - [Ubuntu]"
    "Tilix - [Fedora]"
    "StarShip - [Snap]"
    "Powerline - [Ubuntu]"
    "Powerline - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Guake (Xorg) - [Ubuntu]")
                sudo apt install guake
                wait
                bash_cmd "apps"
                ;;
            "Tilix - [Ubuntu]")
                sudo apt install tilix
                echo '
    ---
    Lancer le mode Guake
    Sur Xorg : tilix --quake
    Sur Wayland : env GDK_BACKEND=x11 tilix --quake
    ---
                '
                wait
                bash_cmd "apps"
                ;;
            "Tilix - [Fedora]")
                sudo dnf install tilix
                echo '
    ---
    Lancer le mode Guake
    Sur Xorg : tilix --quake
    Sur Wayland : env GDK_BACKEND=x11 tilix --quake
    ---
                '
                wait
                bash_cmd "apps"
                ;;
            "StarShip - [Snap]")
                sudo snap install starship
                echo 'eval "$(starship init bash)"'
                cp /tmp/mw_tools/ressources/scripts/configs/starship.toml ~/.config/starship.toml
                wait
                bash_cmd "apps"
                ;;
            "Powerline - [Ubuntu]")
                sudo apt install powerline
                echo '
    Copier le code ci dessous dans ~/.bashrc

    if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
        source /usr/share/powerline/bindings/bash/powerline.sh
    fi
                '
                wait
                bash_cmd "apps"
                ;;
            "Powerline - [Fedora]")
                sudo dnf install powerline
                echo '
    Copier le code ci dessous dans ~/.bashrc

    if [ -f `which powerline-daemon` ]; then
      powerline-daemon -q
      POWERLINE_BASH_CONTINUATION=1
      POWERLINE_BASH_SELECT=1
      . /usr/share/powerline/bash/powerline.sh
    fi
                '
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Timeshift
##############################
function app_timeshift {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Timeshift - [Ubuntu]"
    "Timeshift - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Timeshift - [Ubuntu]")
                sudo add-apt-repository -y ppa:teejee2008/timeshift
                sudo apt-get update
                sudo apt-get install timeshift
                wait
                bash_cmd "apps"
                ;;
            "Timeshift - [Fedora]")
                sudo dnf install timeshift
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
##############################
# Torrent
##############################
function app_torrent {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "qBittorrent - [Flatpak]"
    "Transmission - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "qBittorrent - [Flatpak]")
                flatpak install flathub org.qbittorrent.qBittorrent
                wait
                bash_cmd "apps"
                ;;
            "Transmission - [Flatpak]")
                flatpak install flathub com.transmissionbt.Transmission
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}
##############################
# Touchegg
##############################
function app_touchegg {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Touchegg - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Touchegg - [URL]")
                xdg-open https://github.com/JoseExposito/touchegg/releases
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Uget
##############################
function app_uget {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Uget - [Ubuntu]"
    "Uget - [Fedora]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "Uget - [Ubuntu]")
                sudo apt install uget
                wait
                bash_cmd "apps"
                ;;
            "Uget - [Fedora]")
                sudo dnf install uget
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# VirtualBox
##############################
function app_virtualbox {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "VirtualBox - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "VirtualBox - [URL]")
                xdg-open https://www.virtualbox.org/wiki/Downloads
                wait
                bash_cmd "apps"
                ;;
            "VirtualBox + ExtPack par Oracle - [Ubuntu]")
                cd /tmp
                wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - &&
                wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - &&
                echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list &&
                sudo apt update &&
                sudo apt install linux-headers-$(uname -r) dkms &&
                sudo apt-get install virtualbox-6.1 &&
                wget https://download.virtualbox.org/virtualbox/6.1.6/Oracle_VM_VirtualBox_Extension_Pack-6.1.6.vbox-extpack &&
                sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.6.vbox-extpack
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# VLC
##############################
function app_vlc {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "VLC - [Flatpak]"
    "VLC - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "VLC - [Flatpak]")
                flatpak install flathub org.videolan.VLC
                wait
                bash_cmd "apps"
                ;;
            "VLC - [Snap]")
                sudo snap install vlc
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# VSCODE
##############################
function app_vscode {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "VScode - [Flatpak]"
    "VScode - [Snap]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash_cmd "apps"
                ;;
            "VScode - [Flatpak]")
                flatpak install flathub com.visualstudio.code
                wait
                bash_cmd "apps"
                ;;
            "VScode - [Snap]")
                sudo snap install code --classic
                wait
                bash_cmd "apps"
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}