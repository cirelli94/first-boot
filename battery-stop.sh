#!/bin/bash

#check if you run the script as root
if [ "$(whoami)" != "root" ]; then
    echo "You must to run $(basename $0) script as root."
    exit
fi
