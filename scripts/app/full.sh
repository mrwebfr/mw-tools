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
    "Flatpak - [Ubuntu] (Redémarrage)"
    "Flatpak Beta - [Ubuntu]"
    "Pilotes Nvidia PPA - [Ubuntu]"
    "ZRam - [Ubuntu]"
    "EarlyOOM (Ram) - [Ubuntu]"
    "Codecs multimédias essentiels - [Ubuntu]"
    "Microsoft fonts - [Ubuntu]"
    "Fonts Microsoft & Apple - [GitHub]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash scripts/app.sh
                break
                ;;
            "Paquets utiles - [Ubuntu]")
                sudo apt install git subversion rar bmon htop curl gnome-tweaks dfc ncdu wavemon libcanberra-gtk-module
                bash scripts/app.sh
                break
                ;;
            "Flatpak - [Ubuntu] (Redémarrage)")
                sudo apt install -y flatpak gnome-software-plugin-flatpak
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                flatpak update --appstream
                bash scripts/app.sh
                break
                ;;
            "Flatpak Beta - [Ubuntu]")
                flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
                flatpak update --appstream
                bash scripts/app.sh
                break
                ;;
            "Pilotes Nvidia PPA - [Ubuntu]")
                sudo add-apt-repository ppa:graphics-drivers/ppa
                sudo apt update
                bash scripts/app.sh
                break
                ;;
            "ZRam - [Ubuntu]")
                sudo apt-get install zram-config
                sudo service zram-config start
                echo '
    sudo nano /usr/bin/init-zram-swapping
    mem=$(((totalmem / 2 / ${NRDEVICES}) * 1024))
    à
    mem=$(((totalmem * 2 / ${NRDEVICES}) * 1024))
    '
                bash scripts/app.sh
                break
                ;;
            "EarlyOOM (Ram) - [Ubuntu]")
                sudo apt install earlyoom
                bash scripts/app.sh
                break
                ;;
            "Codecs multimédias essentiels - [Ubuntu]")
                sudo add-apt-repository multiverse
                sudo apt install ubuntu-restricted-extras
                bash scripts/app.sh
                break
                ;;
            "Microsoft fonts - [Ubuntu]")
                sudo add-apt-repository multiverse
                sudo apt update && sudo apt install ttf-mscorefonts-installer
                sudo fc-cache -f -v
                bash scripts/app.sh
                break
                ;;
            "Fonts Microsoft & Apple - [GitHub]")
                sudo rm -r /usr/share/fonts/mw_fonts
                cd /tmp/mw_tools/
                wget https://github.com/mrwebfr/mw-tools/releases/download/1.0.0/mw_fonts.zip
                unzip mw_fonts.zip
                rm mw_fonts.zip
                sudo mv /tmp/mw_tools/mw_fonts /usr/share/fonts/mw_fonts
                bash scripts/app.sh
                break
                ;;
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
                bash scripts/app.sh
                break
                ;;
            "Paquets utiles - [Fedora]")
                sudo dnf install git subversion rar bmon htop curl gnome-tweaks dfc ncdu wavemon
                bash scripts/app.sh
                break
                ;;
            "Flatpak - [Fedora]")
                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                flatpak update --appstream
                bash scripts/app.sh
                break
                ;;
            "Flatpak Beta - [Fedora]")
                flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
                flatpak update --appstream
                bash scripts/app.sh
                break
                ;;
            "Snap - [Fedora]")
                app_snap
                bash scripts/app.sh
                break
                ;;
            "RPMFusion Free - [Fedora]")
                sudo dnf install --nogpgcheck https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
                sudo dnf update
                sudo dnf install rpmfusion-free-appstream-data
                bash scripts/app.sh
                break
                ;;
            "RPMFusion Non-Free - [Fedora]")
                sudo dnf install --nogpgcheck https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
                sudo dnf update
                sudo dnf install rpmfusion-nonfree-appstream-data
                bash scripts/app.sh
                break
                ;;
            "Codecs multimédias - [Fedora]")
                sudo dnf install gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly
                sudo dnf install gstreamer1-plugins-{base,good,bad-free,good-extras,bad-free-extras} gstreamer1-plugin-mpg123
                sudo dnf install gstreamer1-libav gstreamer1-plugins-{bad-freeworld,ugly}
                bash scripts/app.sh
                break
                ;;
            "NCDU (disk space) - [Fedora]")
                sudo dnf install ncdu
                bash scripts/app.sh
                break
                ;;
            "Microsoft fonts - [Fedora DNF]")
                sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
                sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
                bash scripts/app.sh
                break
                ;;
            "Fonts Microsoft & Apple - [GitHub]")
                sudo rm -r /usr/share/fonts/mw_fonts
                cd /tmp/mw_tools/
                wget https://github.com/mrwebfr/mw-tools/releases/download/1.0.0/mw_fonts.zip
                unzip mw_fonts.zip
                rm mw_fonts.zip
                sudo mv /tmp/mw_tools/mw_fonts /usr/share/fonts/mw_fonts
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Snap - [Fedora]")
                sudo dnf install snapd
                sudo ln -s /var/lib/snapd/snap /snap
                bash scripts/app.sh
                break
                ;;
            "Snap store - [Snap]")
                sudo snap install snap-store
                bash scripts/app.sh
                break
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
            bash scripts/app.sh
            break
            ;;
        "Flash Player - [Ubuntu]")
            clear
            sudo apt install adobe-flashplugin
            bash scripts/app.sh
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
                bash scripts/app.sh
                break
                ;;
            "Anydesk - [Flatpak]")
                flatpak install flathub com.anydesk.Anydesk
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Atom - [Flatpak]")
                flatpak install io.atom.Atom
                bash scripts/app.sh
                break
                ;;
            "Atom - [Snap]")
                sudo snap install atom --classic
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Audacity - [Flatpak]")
                flatpak install flathub org.audacityteam.Audacity
                bash scripts/app.sh
                break
                ;;
            "Audacity - [Snap]")
                sudo snap install audacity
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Bitwarden - [Flatpak]")
                flatpak install com.bitwarden.desktop
                bash scripts/app.sh
                break
                ;;
            "Bitwarden - [Snap]")
                sudo snap install bitwarden
                bash scripts/app.sh
                break
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
    "Flameshot - [Ubuntu]"
    "Flameshot - [Fedora]"
    "SimpleScreenRecorder - [Snap]"
    "Kooha - [Flatpak]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash scripts/app.sh
                break
                ;;
            "Flameshot - [Ubuntu]")
                sudo apt install flameshot
                bash scripts/app.sh
                break
                ;;
            "Flameshot - [Fedora]")
                sudo dnf install flameshot
                bash scripts/app.sh
                break
                ;;
            "Flameshot - [Snap]")
                sudo snap install flameshot
                bash scripts/app.sh
                break
                ;;
            "Flameshot - [Flatpak]")
                flatpak install flathub org.flameshot.Flameshot
                bash scripts/app.sh
                break
                ;;
            "SimpleScreenRecorder - [Snap]")
                sudo snap install simplescreenrecorder
                bash scripts/app.sh
                break
                ;;
            "Kooha - [Flatpak]")
                flatpak install flathub io.github.seadve.Kooha
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Coolero - [Flatpak]")
                flatpak install flathub org.coolero.Coolero
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Detwinner (Duplicate) - [Flatpak]")
                flatpak install flathub com.neatdecisions.Detwinner
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Filezilla - [Flatpak]")
                flatpak install flathub org.filezillaproject.Filezilla
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Firefox - [Snap]")
                sudo snap install firefox
                bash scripts/app.sh
                break
                ;;
            "Firefox Beta - [Snap]")
                sudo snap install firefox --beta
                bash scripts/app.sh
                break
                ;;
            "Firefox Nightly- [Snap]")
                sudo snap install firefox --edge
                bash scripts/app.sh
                break
                ;;
            "Firefox - [Flatpak]")
                flatpak install flathub org.mozilla.firefox
                bash scripts/app.sh
                break
                ;;
            "Firefox Beta - [Flatpak]")
                flatpak install --user https://flathub.org/beta-repo/appstream/org.mozilla.firefox.flatpakref
                bash scripts/app.sh
                break
                ;;
            "Brave - [Flatpak]")
                flatpak install flathub com.brave.Browser
                bash scripts/app.sh
                break
                ;;
            "Brave - [Snap]")
                sudo snap install brave
                bash scripts/app.sh
                break
                ;;
            "Chrome - [Flatpak]")
                flatpak install flathub com.google.Chrome
                bash scripts/app.sh
                break
                ;;
            "Chromium - [Snap]")
                sudo snap install chromium
                bash scripts/app.sh
                break
                ;;
            "Chromium - [Flatpak]")
                flatpak install flathub org.chromium.Chromium
                bash scripts/app.sh
                break
                ;;
            "Opera - [Snap]")
                sudo snap install opera
                bash scripts/app.sh
                break
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
    "Github Desktop - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash scripts/app.sh
                break
                ;;
            "Github Desktop - [URL]")
                xdg-open https://github.com/shiftkey/desktop
                bash scripts/app.sh
                break
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
    "Installer Hypnotix"
    "Supprimer Hypnotix"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash scripts/app.sh
                break
                ;;
            "Installer Hypnotix")
                sudo add-apt-repository ppa:kelebek333/mint-tools
                sudo apt install hypnotix
                bash scripts/app.sh
                break
                ;;
            "Supprimer Hypnotix")
                sudo apt autoremove --purge hypnotix
                sudo add-apt-repository --remove ppa:kelebek333/mint-tools
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Krita - [Flatpak]")
                flatpak install flathub org.kde.krita
                bash scripts/app.sh
                break
                ;;
            "Krita - [Snap]")
                sudo snap install krita
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "LibreOffice - [Flatpak]")
                flatpak install flathub org.libreoffice.LibreOffice
                bash scripts/app.sh
                break
                ;;
            "LibreOffice - [Snap]")
                sudo snap install libreoffice
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Mainline Kernel - [Ubuntu]")
                sudo add-apt-repository ppa:cappelikan/ppa
            	sudo apt update
            	sudo apt install mainline
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "MediaInfo - [Flatpak]")
                flatpak install flathub net.mediaarea.MediaInfo
                bash scripts/app.sh
                break
                ;;
            "MediaInfo - [Snap]")
                sudo snap install mediainfo
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "AppEditor - [Flatpak]")
                flatpak install flathub com.github.donadigo.appeditor
                bash scripts/app.sh
                break
                ;;
            "MenuLibre - [Ubuntu]")
                sudo apt install menulibre
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "NextCloud Client - [Flatpak]")
                flatpak install flathub org.nextcloud.Nextcloud
                #flatpak override --user --own-name=org.kde.* org.nextcloud.Nextcloud
                bash scripts/app.sh
                break
                ;;
            "NextCloud Client Dev - [Ubuntu]")
                sudo add-apt-repository ppa:nextcloud-devs/client
                sudo apt update
                sudo apt install nextcloud-client nextcloud-client-nautilus nautilus-nextcloud
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "OnlyOffice - [Snap]")
                sudo snap install onlyoffice-desktopeditors
                bash scripts/app.sh
                break
                ;;
            "OnlyOffice - [Flatpak] (Polices manquantes)")
                flatpak install org.onlyoffice.desktopeditors
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "PDF Arranger - [Flatpak]")
                flatpak install flathub com.github.jeromerobert.pdfarranger
                bash scripts/app.sh
                break
                ;;
            "PDF Mix Tool - [Flatpak]")
                flatpak install flathub eu.scarpetta.PDFMixTool
                bash scripts/app.sh
                break
                ;;
            "PDF Mix Tool - [Snap]")
                sudo snap install pdfmixtool
                bash scripts/app.sh
                break
                ;;
            "PDF Okular - [Flatpak]")
                flatpak install org.kde.okular
                bash scripts/app.sh
                break
                ;;
            "PDF Okular - [Snap]")
                sudo snap install okular
                bash scripts/app.sh
                break
                ;;
            "PDF Slicer - [Flatpak]")
                flatpak install flathub com.github.junrrein.PDFSlicer
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Piper - [Flatpak]")
                flatpak install flathub org.freedesktop.Piper
                bash scripts/app.sh
                break
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
    "Plex Player - [URL]"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash scripts/app.sh
                break
                ;;
            "Plex Player - [URL]")
                xdg-open https://knapsu.eu/plex/
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "ProtonVPN - [URL]")
                xdg-open https://protonvpn.com/support/official-linux-client/
                xdg-open https://protonvpn.com/support/knowledge-base/official-linux-client
                bash scripts/app.sh
                break
                ;;
            # "ProtonVPN - [Fedora]")
            #     sudo wget -q -O - https://repo.protonvpn.com/debian/public_key.asc | sudo apt-key add - && sudo add-apt-repository 'deb [arch=amd64] https://repo.protonvpn.com/debian unstable main'
            #     sudo apt-get update && sudo apt-get install protonvpn
            #     bash scripts/app.sh
            # break
            #     ;;
            "Désinstaller ProtonVPN PIP3 - [Ubuntu]")
                sudo pip3 uninstall protonvpn-cli
                sudo apt autoremove --purge dialog python3-pip python3-setuptools
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "PO Poedit - [Flatpak]")
                flatpak install flathub net.poedit.Poedit
                bash scripts/app.sh
                break
                ;;
            "PO Gtranslator- [Flatpak]")
                flatpak install flathub org.gnome.Gtranslator
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Mousai - [Flatpak]")
                flatpak install flathub io.github.seadve.Mousai
                bash scripts/app.sh
                break
                ;;
            "SongRec - [Flatpak]")
                flatpak install flathub com.github.marinm.songrec
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Skype - [Flatpak]")
                flatpak install flathub com.skype.Client
                bash scripts/app.sh
                break
                ;;
            "Skype - [Snap]")
                sudo snap install skype --classic
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "SpeedTest - [Ubuntu]")
                sudo apt install speedtest-cli
                pip install speedtest-cli
                bash scripts/app.sh
                break
                ;;
            "SpeedTest - [Fedora]")
                sudo dnf install speedtest-cli
                pip install speedtest-cli
                bash scripts/app.sh
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

##############################
# Snapcraft
##############################
function app_snapcraft {
    PS3='
Veuillez faire un choix : '
    options=(
    "Retour"
    "Snapcraft - [URL]"
    "Copier la config"
    )

    select opt in "${options[@]}"
    do
        case $opt in
            "Retour")
                bash scripts/app.sh
                break
                ;;
            "Snapcraft - [URL]")
                xdg-open https://snapcraft.io/starship
                bash scripts/app.sh
                break
                ;;
            "Copier la config")
                cp /tmp/mw_tools/ressources/scripts/starship.toml ~/.config/starship.toml
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Spotify - [Flatpak]")
                flatpak install com.spotify.Client
                bash scripts/app.sh
                break
                ;;
            "Spotify - [Snap]")
                sudo snap install spotify
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Stacer - [Ubuntu]")
                sudo apt install stacer
                bash scripts/app.sh
                break
                ;;
            "Stacer - [Fedora]")
                sudo dnf install stacer
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Telegram - [Flatpak]")
                flatpak install org.telegram.desktop
                bash scripts/app.sh
                break
                ;;
            "Telegram - [Snap]")
                sudo snap install telegram-desktop
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Guake (Xorg) - [Ubuntu]")
                sudo apt install guake
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "StarShip - [Snap]")
                sudo snap install starship
                echo 'eval "$(starship init bash)"'
                cp /tmp/mw_tools/ressources/scripts/configs/starship.toml ~/.config/starship.toml
                bash scripts/app.sh
                break
                ;;
            "Powerline - [Ubuntu]")
                sudo apt install powerline
                echo '
    Copier le code ci dessous dans ~/.bashrc

    if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
        source /usr/share/powerline/bindings/bash/powerline.sh
    fi
                '
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Timeshift - [Ubuntu]")
                sudo add-apt-repository -y ppa:teejee2008/timeshift
                sudo apt-get update
                sudo apt-get install timeshift
                bash scripts/app.sh
                break
                ;;
            "Timeshift - [Fedora]")
                sudo dnf install timeshift
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "qBittorrent - [Flatpak]")
                flatpak install flathub org.qbittorrent.qBittorrent
                bash scripts/app.sh
                break
                ;;
            "Transmission - [Flatpak]")
                flatpak install flathub com.transmissionbt.Transmission
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Touchegg - [URL]")
                xdg-open https://github.com/JoseExposito/touchegg/releases
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "Uget - [Ubuntu]")
                sudo apt install uget
                bash scripts/app.sh
                break
                ;;
            "Uget - [Fedora]")
                sudo dnf install uget
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "VirtualBox - [URL]")
                xdg-open https://www.virtualbox.org/wiki/Downloads
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "VLC - [Flatpak]")
                flatpak install flathub org.videolan.VLC
                bash scripts/app.sh
                break
                ;;
            "VLC - [Snap]")
                sudo snap install vlc
                bash scripts/app.sh
                break
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
                bash scripts/app.sh
                break
                ;;
            "VScode - [Flatpak]")
                flatpak install flathub com.visualstudio.code
                bash scripts/app.sh
                break
                ;;
            "VScode - [Snap]")
                sudo snap install code --classic
                bash scripts/app.sh
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}