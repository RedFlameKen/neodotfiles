#!/bin/bash

echo "Power: $(cat /sys/class/power_supply/BAT0/capacity)%"
echo "Status: $(cat /sys/class/power_supply/BAT0/status)"

exit
