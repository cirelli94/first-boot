#!/bin/bash
################################################################################
# TODO:
# AGGIUNGI uso di powertop?
# aggiungi pm-utils e hibernate?

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
echo	This is free software, and you are welcome to redistribute it
echo	under certain conditions
sleep 3
################################################################################
# TODO aggiungi uso di grub (dopo aver fatto backup)

# copy actual version of grub file configuration
#sudo cp /etc/default/grub /etc/default/grub.old

################################################################################
clear
echo ###########################################################################
echo ADD REPOSITORIES
echo ###########################################################################
sleep 3

# Needed for add-apt-repository
sudo apt install software-properties-common

#atom
sudo add-apt-repository -y ppa:webupd8team/atom

#flux
sudo add-apt-repository -y ppa:nathan-renniewaldock/flux

#google-chrome-stable
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"

#syncthing-gtk
sudo add-apt-repository -y ppa:nilarimogard/webupd8

#skype
sudo dpkg --add-architecture i386
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

#scudcloud / slack
sudo add-apt-repository -y ppa:rael-gc/scudcloud

#picard from musicBrainz
sudo add-apt-repository -y ppa:musicbrainz-developers/stable

#syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# Add the "release" channel to your APT sources:
echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

# GNOME Shell Integration
sudo add-apt-repository -y ppa:ne0sight/chrome-gnome-shell


################################################################################
# remove useless programs
# sudo apt-get remove -y

################################################################################
clear
echo ###########################################################################
echo UPDATE ALL
echo ###########################################################################
sleep 3

sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

################################################################################
clear
echo ###########################################################################
echo INSTALL APPS
echo ###########################################################################
sleep 3

for pkg in \
	atom \
	doxygen doxygen-gui deluge \
	eclipse \
	flashplugin-installer fluxgui \
	git gimp gparted google-chrome-stable \
	guake guake-indicator \
	openjdk-8-jdk \
	picard pitivi python-nautilus \
	powertop \
	p7zip p7zip-full p7zip-rar \
	smartmontools scudcloud skype \
	syncthing syncthing-gtk\
	umake unetbootin ubuntu-wallpapers*  \
	variety virtualbox-guest-additions-iso \
	vlc valgrind \
	do sudo apt-get -y --quiet install $pkg
done

# android-studio
sudo umake android-studio

################################################################################
clear
echo ###########################################################################
echo INSTALL EXTENSIONS FOR GNOME
echo ###########################################################################
sleep 3

# To manage extension via https://extensions.gnome.org/
sudo apt-get -y --quiet install 	chrome-gnome-shell

#Gnome Shell Extension Installer
# https://github.com/ianbrunelli/gnome-shell-extension-installer
wget -O gnome-shell-extension-installer "https://github.com/ianbrunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

# Removable Drive Menu
gnome-shell-extension-installer 7 --yes

# Places Status Indicator
gnome-shell-extension-installer 8 --yes

# Alternate Tab
gnome-shell-extension-installer 15 --yes

# User Themes
gnome-shell-extension-installer 19 --yes

# Shellshape
gnome-shell-extension-installer 294 --yes

#dash to dock
gnome-shell-extension-installer 307 --yes

# Launch new instance
gnome-shell-extension-installer 600 --yes

#Imgur Screenshot Uploader
gnome-shell-extension-installer 683 --yes

# OpenWeather
gnome-shell-extension-installer 750 --yes

#Battery Percentage
gnome-shell-extension-installer 818 --yes

#Dynamic Top Bar
gnome-shell-extension-installer 885 --yes

# Cpu Power Manager
gnome-shell-extension-installer 945 --yes

#topicons plus
gnome-shell-extension-installer 1031 --yes

################################################################################
#Start at boot applications
#touch ~/.config/autostart/scudcloud.desktop
#echo [Desktop Entry] > ~/.config/autostart/scudcloud.desktop
#echo Name=scudcloud > ~/.config/autostart/scudcloud.desktop
#echo Exec=scudcloud --minimize MINIMIZE > ~/.config/autostart/scudcloud.desktop
#echo Type=Application> ~/.config/autostart/scudcloud.desktop

################################################################################
clear
echo ###########################################################################
echo PERMANENT BASH ALIASES
echo ###########################################################################
sleep 3

echo "" >> ~/.bashrc
echo "# Alias" >> ~/.bashrc
echo "alias meteo='curl http://wttr.in/albino'" >> ~/.bashrc


################################################################################
clear
echo ###########################################################################
echo INSTALL APPS THAT REQUIRE CLICKS
echo ###########################################################################
sleep 3

sudo apt-get install -y ubuntu-restricted-extras
sudo apt-get install -y steam

################################################################################
clear
# TODO prompt for a reboot

echo ""
echo ""
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
