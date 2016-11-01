#!/bin/bash
sleep 60
capacity=`cat /sys/class/power_supply/BAT0/capacity`
if [ $capacity -le 100 ]
then
	# If there is battery...
	notify-send "START BatteryScript"
	sudo powertop --auto-tune && echo "set powertop --auto-tune"
	xbacklight -set 40 && echo "set xbacklight"
else
	# if there's no battery
	echo "AC"
	notify-send "No battery, full power mode!"
	skype &
	deluge-gtk &
fi

# This set cpufreq and governor every 5 minutes
while true; do
	capacity=`cat /sys/class/power_supply/BAT0/capacity`
	if [ $capacity -le 100 ]
	then
		# If there is battery...
		echo "BATTERY"
		echo "cpufreq-set " && date "+%H:%M"
		for numcpu in {0..7}
		do
			sudo cpufreq-set -c $numcpu -u 800MHz -g powersave
		done
	else
		# if there's no battery
		echo "AC"
	fi
	sleep 300
done
echo "STOP BatterScript"
