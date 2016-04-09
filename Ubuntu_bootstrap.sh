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
sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:danjaredg/jayatana
sudo add-apt-repository -y ppa:jfi/psensor-unstable
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo add-apt-repository -y ppa:team-xbmc/ppa
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update

# Main apps
sudo apt-get -y install ubuntu-restricted-extras wine lm-sensors hddtemp psensor preload
sudo dpkg-reconfigure hddtemp
sudo sensors-detect
sudo apt-get -f install

# Install apps
sudo apt-get -y install vlc skype cheese shutter gparted ubuntu-tweak unity-tweak-tool flashplugin-installer indicator-cpufreq indicator-multiload jayatana keepass2 unetbootin steam soundconverter kodi nautilus-open-terminal p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

# *|*|*|*|*|*|*|*|*|*| Development Stuff *|*|*|*|*|*|*|*|*|*|* #

# Diverse tools to diverse lenguajes
sudo apt-get -y install build-essential linux-headers-$(uname -r) gedit-plugins openjdk-8-jre openjdk-8-jdk git git-core filezilla curl dia zsh

# Install Oh My Zsh
curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh
sudo wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
sudo chsh -s $(which zsh)
## needs to rebot to start working with zsh
sudo reboot

# Install fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

sudo nano ~/.zshrc
## Add to .zshrc
ZSH_THEME="risto"
plugins=(git bower node npm nyan osx rake common-aliases command-not-found)

#Node & NPM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
nvm install node
nvm use node
npm install -g npm node-gyp nodemon mocha karma-cli bower gulp

# Git config
git config --global user.name "Eduardo Gonzalez"
git config --global user.email eduardo.gch@gmail.com
ssh-keygen -t rsa -C $USER"@localhost"

# Install Atom
wget https://atom-installer.github.com/v1.6.0/atom-amd64.deb
sudo dpkg -i atom-amd64.deb
apm install todo-show color-picker emmet minimap atom-beautify editorconfig pigments merge-conflicts color-picker linter jshint atom-jade linter-jade jade-autocompile jade-beautify file-icons highlight-selected minimap-highlight-selected autoclose-html atom-alignment uglify angularjs javascript-snippets angularjs-styleguide-snippets css-snippets jade-snippets

# Install MariaDB
sudo apt-get -y install mariadb-server
sudo /usr/bin/mysql_secure_installation
sudo service mysql start

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get -y update && sudo apt-get -y install mongodb-org

# Install Redis
sudo apt-get -y update && sudo apt-get -y install redis-server
sudo update-rc.d redis-server defaults 
sudo /etc/init.d/redis-server start

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# Install Teamviewer
sudo dpkg --add-architecture i386
sudo apt-get -y update
wget http://downloadus2.teamviewer.com/download/version_11x/teamviewer_11.0.53191_i386.deb
sudo dpkg -i teamviewer_11.0.53191_i386.deb
sudo apt-get -y install -f

# Install Office 2007
# http://nithinaneeshsct06bt.blogspot.com/2012/05/install-microsoft-office-2007-in-ubuntu.html
rm -rf ~/.wine
export WINEARCH=win32
wineboot --update

# Install GUI for OpenVPN
sudo apt-get -y install network-manager-openvpn-gnome
sudo restart network-manager

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
wget https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi-1000-ucode-39.31.5.1.tgz
tar -xvzf iwlwifi-1000-ucode-39.31.5.1.tgz
cd iwlwifi-1000-ucode-39.31.5.1/
sudo cp iwlwifi-*.ucode /lib/firmware
sudo modprobe -r iwldvm
sudo modprobe iwlwifi 11n_disable=1
sudo modprobe iwldvm

# Launchers items in Ubuntu
# http://askubuntu.com/questions/13758/how-can-i-edit-create-new-launcher-items-in-unity-by-hand

# Startup Transmission
1.- Enter Startup Applications
2.- Click Add, enter name Transmission, enter command 
    transmission-gtk --minimized

# Blocklist for transmitions
Blocklist
    http://john.bitsurge.net/public/biglist.p2p.gz

# Install Flexget
sudo apt-get install -y python python-pip
sudo pip install flexget
sudo pip install --upgrade flexget

sudo mkdir ~/.flexget
sudo chmod 777 -R ~/.flexget
nano ~/.flexget/config.yml
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
      - click

tasks:
  feed tv480p:
    rss: http://www.torrentday.com/torrents/rss?download;l24;u=1323865;tp=3254b0e8fd13cc01a47daf9a0a66784b
    template: tv

  feed tvxvid:
    rss: http://www.torrentday.com/torrents/rss?download;l2;u=1323865;tp=3254b0e8fd13cc01a47daf9a0a66784b
    template: tv
#----------------------

crontab -e
@reboot /usr/local/bin/flexget execute --cron
@hourly /usr/local/bin/flexget execute --cron

# *|*|*|*|*|*|*|*|*|*| Clean up this mess *|*|*|*|*|*|*|*|*|*|* #
sudo apt-get -f install && sudo apt-get autoremove && sudo apt-get -y autoclean && sudo apt-get -y clean


echo "Life made Easy with scripts"
echo "Made by Eduardo Gonzalez - https://github.com/eduardogch"
