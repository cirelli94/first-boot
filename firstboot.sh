#!/bin/bash

################################################################################
# add repos

sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
#sudo add-apt-repository -y ppa:freyja-dev/unity-tweak-tool-daily
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

#skype
sudo dpkg --add-architecture i386
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

#scudcloud / slack
sudo apt-add-repository -y ppa:rael-gc/scudcloud

#Only for Gnome
sudo add-apt-repository -y ppa:ne0sight/chrome-gnome-shell


################################################################################
# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

###############################################################################
# install apps
sudo apt-get -y install valgrind doxygen doxygen-gui\
    eclipse openjdk-8-jdk \
    git pitivi deluge unetbootin\
    virtualbox virtualbox-guest-additions-iso\
    gimp p7zip p7zip-full p7zip-rar \
    indicator-multiload curl gparted dkms google-chrome-stable \
    ubuntu-wallpapers*  \
    linux-headers-generic\
    skype vlc flashplugin-installer laptop-mode-tools

################################################################################
#Only for Gnome
sudo apt-get install chrome-gnome-shell

#Gnome Shell Extension Installer
wget -O gnome-shell-extension-installer "https://github.com/ianbrunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

#topicons plus
gnome-shell-extension-installer 1031 3.12 --yes

#Imgur Screenshot Uploader
gnome-shell-extension-installer 683 3.12 --yes

#Battery Percentage
gnome-shell-extension-installer 818 3.12 --yes




################################################################################
# requires clicks
sudo apt-get install -y ubuntu-restricted-extras
sudo apt-get install -y steam

google-chrome https://slack.com/downloads

################################################################################
# prompt for a reboot
clear
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""

