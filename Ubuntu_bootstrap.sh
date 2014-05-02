#!/bin/bash
#
# Desing for Ubuntu 14.04 Unity Desktop
# Ubuntu bootstrap - A simple script to have ready my ubuntu.
#
# Only run in the console:
# wget https://raw.github.com/eduardogch/ubuntu-bootstrap/master/bootstrap.sh -O - | sh

# Update repos and packages.
sudo apt-get -y update 
sudo apt-get -y upgrade


# *|*|*|*|*|*|*|*|*|*| Essential Apps *|*|*|*|*|*|*|*|*|*|* #

# Adding and install repo's apps.
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:ubuntu-wine/ppa 
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:danjaredg/jayatana
sudo add-apt-repository -y ppa:thefanclub/grive-tools
sudo apt-get -y update

sudo apt-get -y install grub-customizer wine vlc tlp tlp-rdw jayatana grive-tools

sudo tlp start

# Adding and install Unity and indicators apps.
sudo apt-add-repository -y ppa:diesch/testing
sudo apt-add-repository -y ppa:atareao/atareao
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get -y update

sudo apt-get -y install classicmenu-indicator indicator-cpufreq my-weather-indicator prime-indicator

# Install most important apps
sudo apt-get -y install p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller 

sudo apt-get -y install ubuntu-restricted-extras preload unity-tweak-tool compizconfig-settings-manager gparted gconf-editor hplip hplip-gui

sudo apt-get -y install chromium-browser pinta furiusisomount unetbootin skype nautilus-dropbox shutter easytag calibre pitivi gdebi adobe-flashplugin pepperflashplugin-nonfree xchat nautilus-open-terminal nautilus-image-converter keepass2 deluge

sudo update-pepperflashplugin-nonfree --install


# *|*|*|*|*|*|*|*|*|*| Development Stuff *|*|*|*|*|*|*|*|*|*|* #

# Diverse tools to diverse lenguajes
sudo apt-get -y install build-essential linux-headers-$(uname -r) gedit-plugins geany geany-plugins git giggle meld mysql-workbench jmeter planner dia filezilla curl openjdk-7-jdk ant maven virtualbox


# *|*|*|*|*|*|*|*|*|*| Remove Apps *|*|*|*|*|*|*|*|*|*|* #

# Remove unity-lens
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"


# *|*|*|*|*|*|*|*|*|*| Clean up this mess *|*|*|*|*|*|*|*|*|*|* #

sudo apt-get -y update 
sudo apt-get -y upgrade
sudo apt-get -y autoclean
sudo apt-get -y clean

echo "Life is Easy with scripts"
echo "Made by Eduardo Gonzalez - https://github.com/eduardogch"


# Disable Errors - Ubuntu 14.04
# http://ubuntuhandbook.org/index.php/2013/09/ubuntu-13-10-quick-tip-disable-apport-error-reporting/

# Wifi - Intel Centrino Wireless-N 1000 
# http://askubuntu.com/a/362835

# Install Office 2007 - Ubuntu 14.04
# http://nithinaneeshsct06bt.blogspot.com/2012/05/install-microsoft-office-2007-in-ubuntu.html

# Install Teamviewer 9 - Ubuntu 14.04
# Lib needed http://ubuntuforums.org/archive/index.php/t-1936044.html
sudo apt-get install libxtst6:i386
# http://askubuntu.com/a/453218

# IntelliJ IDEA - Ubuntu 14.04
# http://wiki.jetbrains.net/intellij/Installing_and_running_IntelliJ_IDEA_on_Ubuntu#Installing_IntelliJ_IDEA

# MongoDB 2.4
# http://docs.mongodb.org/v2.4/tutorial/install-mongodb-on-ubuntu/
# Error dbpath
# http://www.joshondevelopment.com/post/21207640961/getting-started-with-mongodb-dbpath-data-db-does

# Launchers items in Ubuntu
# http://askubuntu.com/questions/13758/how-can-i-edit-create-new-launcher-items-in-unity-by-hand
