#!/bin/bash


VENDOR=$(cat /sys/class/dmi/id/sys_vendor)

if [ "$VENDOR" == "Apple Inc." ]
then
  TEMP_INPUT="/sys/class/hwmon/hwmon3/temp2_input"
elif [ "$VENDOR" == "LENOVO" ]
then
  TEMP_INPUT="/sys/class/hwmon/hwmon4/temp2_input"
fi

t=$(cat $TEMP_INPUT); 
echo "$t / 1000" | bc -s | awk '{print " "$1"°C"}'; 

if [ "$t" -gt 75000 ];
then 
  exit 33; 
fi; 
exit 0

