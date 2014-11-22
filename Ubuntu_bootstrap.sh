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
sudo add-apt-repository -y ppa:xorg-edgers/ppa
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:ubuntu-wine/ppa 
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:diesch/testing
sudo add-apt-repository -y ppa:danjaredg/jayatana
sudo add-apt-repository -y ppa:jfi/psensor-unstable
sudo add-apt-repository -y ppa:webupd8team/popcorntime
sudo add-apt-repository -y ppa:webupd8team/nemo
sudo apt-get -y update
sudo apt-get -f install

# Install most important apps
sudo apt-get -y install grub-customizer nvidia-settings nvidia-prime ubuntu-restricted-extras wine tlp tlp-rdw preload

# Install in software update the lastest driver

sudo apt-get -y install vlc gimp ubuntu-wallpapers* skype cheese shutter gdebi nemo nemo-fileroller nemo-terminal dconf-tools gparted ubuntu-tweak unity-tweak-tool pithos flashplugin-installer classicmenu-indicator indicator-cpufreq jayatana keepass2 unetbootin steam popcorn-time soundconverter

xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

sudo apt-get -f install && sudo apt-get autoremove

sudo apt-get -y install p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

sudo apt-get -y install lm-sensors hddtemp psensor thermald
sudo dpkg-reconfigure hddtemp
sudo sensors-detect
sudo service kmod start


# *|*|*|*|*|*|*|*|*|*| Development Stuff *|*|*|*|*|*|*|*|*|*|* #

# Diverse tools to diverse lenguajes
sudo apt-get -y install build-essential linux-headers-$(uname -r) gedit-plugins openjdk-7-jre openjdk-7-jdk git filezilla curl virtualbox dia

git config --global user.name "Eduardo Gonzalez"
git config --global user.email eduardo.gch@gmail.com


# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# Install Teamviewer
sudo dpkg --add-architecture i386
sudo apt-get -y update
wget http://www.teamviewer.com/download/teamviewer_linux.deb
sudo dpkg -i teamviewer_linux.deb
sudo apt-get -y install -f


# *|*|*|*|*|*|*|*|*|*| Remove Apps *|*|*|*|*|*|*|*|*|*|* #

# Remove unity-lens
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Disable crash reports:
sudo service apport stop
sudo nano /etc/default/apport
#last line change it to "enabled=0"

# Wifi - Intel Centrino Wireless-N 1000 
# http://askubuntu.com/a/362835
# http://ubuntuforums.org/showthread.php?t=2220377
tar -xvzf iwlwifi-1000-ucode-39.31.5.1.tgz
cd iwlwifi-1000-ucode-39.31.5.1/
sudo cp iwlwifi-1000-5.ucode /lib/firmware/
sudo modprobe -r iwldvm
sudo modprobe iwlwifi 11n_disable=1
sudo modprobe iwldvm

# Launchers items in Ubuntu
# http://askubuntu.com/questions/13758/how-can-i-edit-create-new-launcher-items-in-unity-by-hand

###  Config Cron ### 
sudo crontab -e
0 */03 * * * root (apt-get update && apt-get -y -d upgrade) > /dev/null
0 */03 * * * root (apt-get -f install && apt-get -y autoremove && apt-get -y autoclean && apt-get -y clean) > /dev/null

# *|*|*|*|*|*|*|*|*|*| Clean up this mess *|*|*|*|*|*|*|*|*|*|* #
sudo apt-get -f install
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean

echo "Life is Easy with scripts"
echo "Made by Eduardo Gonzalez - https://github.com/eduardogch"
