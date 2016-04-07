#!/bin/bash
################################################################################

#   Copyright (C) 2016 Fabrizio Cirelli

#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

echo	first-boot.sh
echo	Copyright \(C\) 2016 Fabrizio Cirelli
echo	This program comes with ABSOLUTELY NO WARRANTY
echo    This is free software, and you are welcome to redistribute it
echo    under certain conditions

################################################################################
# add repos

#atom
sudo add-apt-repository ppa:webupd8team/atom

#flux
sudo add-apt-repository ppa:nathan-renniewaldock/flux

#google-chrome-stable
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"

#syncthing-gtk
sudo add-apt-repository ppa:nilarimogard/webupd8

#skype
sudo dpkg --add-architecture i386
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

#scudcloud / slack
sudo apt-add-repository -y ppa:rael-gc/scudcloud

#picard from musicBrainz
sudo add-apt-repository -y ppa:musicbrainz-developers/stable

#syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# Add the "release" channel to your APT sources:
echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

################################################################################
# remove useless programs
sudo apt-get remove -y \
	firefox imagemagick

################################################################################
# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

###############################################################################
# install apps
sudo apt-get -y install  \
	atom \
	doxygen doxygen-gui deluge \
	eclipse \
 	laptop-mode-tools \
 	flashplugin-installer fluxgui \
 	git gimp gparted google-chrome-stable \
 	openjdk-8-jdk \
 	picard pitivi python-nautilus \
	p7zip p7zip-full p7zip-rar \
 	scudcloud skype syncthing syncthing-gtk\
   unetbootin ubuntu-wallpapers*  \
   virtualbox virtualbox-guest-additions-iso \
   vlc valgrind

################################################################################
#Only for Gnome
# gnome-shell --version

echo ""
echo "===================="
echo " GNOME 3.18 ONLY!!! "
echo "===================="
echo ""

#Gnome Shell Extension Installer
wget -O gnome-shell-extension-installer "https://github.com/ianbrunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

#topicons plus
gnome-shell-extension-installer 1031 3.18 --yes

#Imgur Screenshot Uploader
gnome-shell-extension-installer 683 3.18 --yes

#Battery Percentage
gnome-shell-extension-installer 818 3.18 --yes

################################################################################
#Start at boot applications
#touch ~/.config/autostart/scudcloud.desktop
#echo [Desktop Entry] > ~/.config/autostart/scudcloud.desktop
#echo Name=scudcloud > ~/.config/autostart/scudcloud.desktop
#echo Exec=scudcloud --minimize MINIMIZE > ~/.config/autostart/scudcloud.desktop
#echo Type=Application> ~/.config/autostart/scudcloud.desktop

################################################################################
# Alias
alias meteo='curl http://wttr.in/albino'

################################################################################
# requires clicks
sudo apt-get install -y ubuntu-restricted-extras
sudo apt-get install -y steam

################################################################################
# prompt for a reboot

echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
