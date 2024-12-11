#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install firefox
# this would install a package from rpmfusion
# rpm-ostree install codium
# install gnome kiosk
# rpm-ostree install gnome-kiosk gnome-kiosk-script-session

bash -c 'echo "X-GNOME-Autostart-enabled=false" >> /etc/xdg/autostart/gnome-initial-setup-first-login.desktop'

useradd student -p please@1234
echo please@1234 | passwd student --stdin

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

mkdir -p /var/home/student/.config/autostart
cat <<EOF > /var/home/student/.config/autostart/firefox.desktop
[Desktop Entry]
Version=1.0
Name=Firefox
GenericName=Web Browser
Comment=Browse the Web
# Exec=firefox %u
Exec=firefox https://legion.tailaadcc.ts.net/
Icon=firefox
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Network;WebBrowser;
Keywords=web;browser;internet;
X-Desktop-File-Install-Version=0.27
EOF

#### Example for enabling a System Unit File
# systemctl enable podman.socket
