#!/bin/bash

if [ -n "$1" ]; then                        # If no arguments are given to the script
   echo "Usage:                             # then print a usage statement and exit
   generate_config.sh hostname ip
   "
   exit 0;
fi

host="$1"
ip="$2"

echo "


">> /ect/nagios/conf.d/"$hostname".cfg



