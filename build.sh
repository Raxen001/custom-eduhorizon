#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1


# bash -c 'echo "X-GNOME-Autostart-enabled=false" >> /etc/xdg/autostart/gnome-initial-setup-first-login.desktop'

# useradd student -p please@1234
# echo please@1234 | passwd student --stdin
# echo please@1234 | passwd root --stdin
#
# cat <<EOF > /home/student/.local/bin/gnome-kiosk-script
# #!/bin/sh
#
# if [ ! "$(pidof eog)" ]
# then
#    flatpak run org.gnome.eog -s /home/kiosk/Pictures
# fi
#
# sleep 1.0
# exec "$0" "$@"
# EOF


# su -l student -c "mkdir -p /var/home/student/"
# su -l student -c "mkdir -p /var/home/student/Desktop"
# su -l student -c "mkdir -p /var/home/student/Downloads"
# su -l student -c "mkdir -p /var/home/student/.config"
# su -l student -c "mkdir -p /var/home/student/.config/autostart"
cat <<EOF > /usr/share/applications/eduhorizon.desktop
[Desktop Entry]
Version=1.0
Name=EduHorizon
GenericName=Learning Management System
Comment=Learn new things
# Exec=firefox %u
Exec=firefox --kiosk https://legion.tailaadcc.ts.net/
Icon=book
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Network;WebBrowser;
Keywords=web;browser;internet;
X-Desktop-File-Install-Version=0.27
EOF
#
cat <<EOF > /usr/share/applications/books.desktop
[Desktop Entry]
Name=Books
Comment=Books Folder
# Translators: Search terms to find this application. Do NOT translate or localize the semicolons! The list MUST also end with a semicolon!
Keywords=folder;manager;explore;disk;filesystem;nautilus;
Exec=nautilus --new-window /usr/share/doc/books/
# Translators: Do NOT translate or transliterate this text (this is an icon file name)!
Icon=ebook-reader
Terminal=false
Type=Application
DBusActivatable=true
StartupNotify=true
X-GNOME-UsesNotifications=true
X-Purism-FormFactor=Workstation;Mobile;
EOF
# this installs a package from fedora repos
mkdir -p /usr/share/doc/books/
wget "https://ncert.nic.in/textbook/pdf/aemr1dd.zip"
mv aemr1dd.zip /usr/share/doc/books/book1.zip

rpm-ostree install flatpak firefox chromium libreoffice neovim
# flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# this would install a package from rpmfusion
# rpm-ostree install codium
# install gnome kiosk
# rpm-ostree install gnome-kiosk gnome-kiosk-script-session
#
#### Example for enabling a System Unit File
# systemctl enable podman.socket
