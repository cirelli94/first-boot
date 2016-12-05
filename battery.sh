#!/bin/bash
# This file should be placed in /usr/local/bin

#check if you run the script as root
if [ "$(whoami)" != "root" ]; then
    echo "You must to run $(basename $0) script as root."
    exit
fi

CHARGING=`cat /sys/class/power_supply/AC0/online`
if [ $CHARGING == 0 ]
then
	# DISCHARGING
	sudo powertop --auto-tune && echo "set powertop --auto-tune"
	su -l cirelli -c xbacklight -set 30 && echo "set xbacklight"
else
	# CHARGING
	su -l cirelli -c skypeforlinux &
	su -l cirelli -c deluge-gtk &
fi
