#!/bin/bash

echo "Power: $(cat /sys/class/power_supply/BAT1/capacity)%"
echo "Status: $(cat /sys/class/power_supply/BAT1/status)"

exit
