#!/bin/bash

#check if you run the script as root
if [ "$(whoami)" != "root" ]; then
    echo "You must to run $(basename $0) script as root."
    exit
fi

# This set cpufreq and governor every 5 minutes
echo "cpufreq-set 3500MHz performance to all cpus"
for numcpu in {0..7}
	do
		sudo cpufreq-set -c $numcpu -u 3500MHz -g performance
	done

