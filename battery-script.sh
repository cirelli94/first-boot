#!/bin/bash
echo "START BatteryScript"
echo ""

sudo powertop --auto-tune && echo "set powertop --auto-tune"

xbacklight -set 50 && echo "set xbackglight"

# This set cpufreq and governor every 5 minutes
while true; do
	echo ""
	echo "cpufreq-set " && date "+%H:%M"
	echo ""
	sudo cpufreq-set -r --max 800MHz
	sudo cpufreq-set -r -g powersave
	sleep 300
done
echo ""
echo "STOP BatterScript"
