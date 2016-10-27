#!/bin/bash
echo "START BatteryScript"

sudo powertop --auto-tune && echo "set powertop --auto-tune"

xbacklight -set 40 && echo "set xbacklight"

#sleep 60

# This set cpufreq and governor every 5 minutes
while true; do
	echo "cpufreq-set " && date "+%H:%M"
	for numcpu in 0 1 2 3 4 5 6 7
 	do
		sudo cpufreq-set -c $numcpu -u 800MHz -g powersave
	done
	sleep 300
done
echo "STOP BatterScript"
