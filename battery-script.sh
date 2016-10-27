#!/bin/bash
echo "START BatteryScript"
echo ""

sudo powertop --auto-tune && echo "set powertop --auto-tune"

xbacklight -set 40 && echo "set xbackglight"

sleep 60

# This set cpufreq and governor every 5 minutes
while true; do
	echo ""
	echo "cpufreq-set " && date "+%H:%M"
	echo ""
	sudo cpufreq-set -c 0-7 -u 800MHz -g powersave
	sleep 300
done
echo ""
echo "STOP BatterScript"
