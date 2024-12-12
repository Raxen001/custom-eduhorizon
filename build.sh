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
# cat <<EOF > /var/home/student/.config/autostart/firefox.desktop
# [Desktop Entry]
# Version=1.0
# Name=Firefox
# GenericName=Web Browser
# Comment=Browse the Web
# # Exec=firefox %u
# Exec=firefox https://legion.tailaadcc.ts.net/
# Icon=firefox
# Terminal=false
# Type=Application
# MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
# StartupNotify=true
# Categories=Network;WebBrowser;
# Keywords=web;browser;internet;
# X-Desktop-File-Install-Version=0.27
# EOF
#
# this installs a package from fedora repos
wget "https://ncert.nic.in/textbook/pdf/aemr1dd.zip"
mv aemr1dd.zip /usr/share/doc/book1.zip
rpm-ostree install firefox chromium
# this would install a package from rpmfusion
# rpm-ostree install codium
# install gnome kiosk
# rpm-ostree install gnome-kiosk gnome-kiosk-script-session
#
#### Example for enabling a System Unit File
# systemctl enable podman.socket
