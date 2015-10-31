#!/bin/bash
#
# Desing for Ubuntu 14.04 Unity Desktop
# Ubuntu bootstrap - A simple script to have ready my ubuntu.
#
# Only run in the console:
# wget https://raw.githubusercontent.com/eduardogch/ubuntu-bootstrap/master/Ubuntu_bootstrap.sh -O - | sh

# Update repos and packages.
sudo apt-get -y update && sudo apt-get -y upgrade

# *|*|*|*|*|*|*|*|*|*| Essential Apps *|*|*|*|*|*|*|*|*|*|* #

# Adding repo's apps.
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:ubuntu-wine/ppa 
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:diesch/testing
sudo add-apt-repository -y ppa:danjaredg/jayatana
sudo add-apt-repository -y ppa:jfi/psensor-unstable
sudo add-apt-repository -y ppa:team-xbmc/ppa
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
sudo apt-get -y update

# Main apps
sudo apt-get -y install grub-customizer ubuntu-restricted-extras wine tlp tlp-rdw lm-sensors hddtemp psensor thermald preload
sudo dpkg-reconfigure hddtemp
sudo sensors-detect
sudo service kmod start
sudo tlp start

# Install apps
sudo apt-get -y install vlc gimp ubuntu-wallpapers* skype cheese shutter gparted ubuntu-tweak unity-tweak-tool flashplugin-installer classicmenu-indicator indicator-cpufreq indicator-multiload jayatana keepass2 unetbootin steam soundconverter spotify-client kodi nautilus-dropbox nautilus-open-terminal

sudo apt-get -y install p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

# *|*|*|*|*|*|*|*|*|*| Development Stuff *|*|*|*|*|*|*|*|*|*|* #

# Diverse tools to diverse lenguajes
sudo apt-get -y install build-essential linux-headers-$(uname -r) gedit-plugins openjdk-7-jre openjdk-7-jdk git filezilla mysql-workbench curl virtualbox dia

#Node, Mongo, RethinkDB & NPM
curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
sudo apt-get install mongodb nodejs node-gyp npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g npm
sudo npm install -g nodemon gulp grunt-cli mocha bower yo node-gyp

git config --global user.name "Eduardo Gonzalez"
git config --global user.email eduardo.gch@gmail.com
ssh-keygen -t rsa -C $USER"@localhost"

# Install RethinkDB
source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install rethinkdb

sudo cp /etc/rethinkdb/default.conf.sample /etc/rethinkdb/instances.d/instance1.conf
sudo /etc/init.d/rethinkdb restart

# Change the port in the RethinkDB Admin panel to 8081 
# This is to avoid problems with other apps
sudo nano /etc/rethinkdb/instances.d/instance1.conf
# http-port=8081

# Install Redis
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
sudo make install
redis-server

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

# Install Office 2007
# http://nithinaneeshsct06bt.blogspot.com/2012/05/install-microsoft-office-2007-in-ubuntu.html
rm -rf ~/.wine
export WINEARCH=win32
wineboot --update

# *|*|*|*|*|*|*|*|*|*| Remove Apps *|*|*|*|*|*|*|*|*|*|* #

# Remove unity-lens
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Disable NTFS partions 
# http://askubuntu.com/questions/124094/how-to-hide-an-ntfs-partition-from-ubuntu

# Disable crash reports:
sudo service apport stop
sudo rm /var/crash/*
gksudo gedit /etc/default/apport
#Change enabled=1 to enabled=0
#http://askubuntu.com/questions/495957/how-to-disable-the-unlock-your-keyring-popup

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

# Startup Transmission
1.- Enter Startup Applications
2.- Click Add, enter name Transmission, enter command 
    transmission-gtk --minimized

# Install Flexget
sudo apt-get install -y python python-pip
sudo pip install flexget
sudo pip install --upgrade flexget

mkdir /.flexget
gedit ~/.flexget/config.yml
#----------------------
templates:
  tv:
    download: ~/Downloads/Torrents/
    exists_series: ~/Downloads/Torrents/
    series:
      - south park
      - game of thrones
      - regular show
      - silicon valley
      - shark thank
      - the profit
      - the big bang theory

tasks:
  feed tv480p:
    rss: http://www.torrentday.com/torrents/rss?download;l24;u=1323865;tp=3254b0e8fd13cc01a47daf9a0a66784b
    template: tv

  feed tvxvid:
    rss: http://www.torrentday.com/torrents/rss?download;l2;u=1323865;tp=3254b0e8fd13cc01a47daf9a0a66784b
    template: tv
#----------------------

sudo chmod 777 ~/.flexget/config.yml
crontab -e
@reboot /usr/local/bin/flexget execute --cron
@hourly /usr/local/bin/flexget execute --cron

# *|*|*|*|*|*|*|*|*|*| Clean up this mess *|*|*|*|*|*|*|*|*|*|* #
sudo apt-get -f install && sudo apt-get autoremove && sudo apt-get -y autoclean && sudo apt-get -y clean


echo "Life made Easy with scripts"
echo "Made by Eduardo Gonzalez - https://github.com/eduardogch"
