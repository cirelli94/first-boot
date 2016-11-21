#!/bin/bash
# TODO add xbacklight
# 	xbacklight -set 30 && echo "set xbacklight"

DISPLAY=:0.0
HOME=/home/cirelli/
XAUTHORITY=$HOME/.Xauthority
export DISPLAY XAUTHORITY HOME

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
else
	# CHARGING
	skypeforlinux &
	deluge-gtk &
fi

# This set cpufreq and governor every 5 minutes
while true; do
	CHARGING=`cat /sys/class/power_supply/AC0/online`
	if [ $CHARGING == 0 ]
	then
		# DISCHARGING
		echo "cpufreq-set 800MHz powersave to all cpus"
		for numcpu in {0..7}
		do
			sudo cpufreq-set -c $numcpu -u 800MHz -g powersave
		done
	else
		# CHARGING
		echo "AC"
	fi
	sleep 300
done