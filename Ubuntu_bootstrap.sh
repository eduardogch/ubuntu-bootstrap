#!/bin/bash
#
# Desing for Ubuntu 14.04 Unity Desktop
# Ubuntu bootstrap - A simple script to have ready my ubuntu.
#
# Only run in the console:
# wget https://raw.githubusercontent.com/eduardogch/ubuntu-bootstrap/master/Ubuntu_bootstrap.sh -O - | sh

# Update repos and packages.
sudo apt-get -y update 
sudo apt-get -y upgrade


# *|*|*|*|*|*|*|*|*|*| Essential Apps *|*|*|*|*|*|*|*|*|*|* #

# Adding and install repo's apps.
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:ubuntu-wine/ppa 
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:diesch/testing
sudo add-apt-repository -y ppa:danjaredg/jayatana

# Install most important apps
sudo apt-get -y install grub-customizer indicator-cpufreq unity-tweak-tool nvidia-prime ubuntu-restricted-extras tlp tlp-rdw

sudo apt-get -y install vlc pinta furiusisomount ubuntu-wallpapers* skype cheese shutter easytag gdebi nautilus-dropbox nautilus-open-terminal nautilus-image-converter gparted ubuntu-tweak unity-tweak-tool pithos wine flashplugin-installer classicmenu-indicator jayatana keepass2

sudo apt-get -y install p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

sudo tlp start

# *|*|*|*|*|*|*|*|*|*| Development Stuff *|*|*|*|*|*|*|*|*|*|* #

# Diverse tools to diverse lenguajes
sudo apt-get -y install build-essential linux-headers-$(uname -r) gedit-plugins geany geany-plugins openjdk-7-jre openjdk-7-jdk git filezilla curl geany git
#http://www.mkyong.com/mongodb/how-to-install-mongodb-on-ubuntu/
sudo apt-get -y install nodejs npm mongodb

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# Install Teamviewer
sudo dpkg --add-architecture i386
sudo apt-get update
wget http://www.teamviewer.com/download/teamviewer_linux.deb
sudo dpkg -i teamviewer_linux.deb
sudo apt-get install -f


# *|*|*|*|*|*|*|*|*|*| Remove Apps *|*|*|*|*|*|*|*|*|*|* #

# Remove unity-lens
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Disable crash reports:
sudo service apport stop
sudo gedit /etc/default/apport
#last line change it to "enabled=0"

# Wifi - Intel Centrino Wireless-N 1000 
# http://askubuntu.com/a/362835
# wget http://wireless.kernel.org/en/users/Drivers/iwlwifi?action=AttachFile&do=get&target=iwlwifi-1000-ucode-39.31.5.1.tgz
# tar -xvzf iwlwifi-1000-ucode-39.31.5.1.tgz 
# cd iwlwifi-1000-ucode-39.31.5.1/
# sudo cp iwlwifi-1000-5.ucode /lib/firmware/

# Launchers items in Ubuntu
# http://askubuntu.com/questions/13758/how-can-i-edit-create-new-launcher-items-in-unity-by-hand


# *|*|*|*|*|*|*|*|*|*| Clean up this mess *|*|*|*|*|*|*|*|*|*|* #
sudo apt-get -f install
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean

echo "Life is Easy with scripts"
echo "Made by Eduardo Gonzalez - https://github.com/eduardogch"
