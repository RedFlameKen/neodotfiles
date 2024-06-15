#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT1/capacity)
batstat=$(cat /sys/class/power_supply/BAT1/status)


if [[ ( $capacity -le 30 && $batstat != "Charging" ) && ($capacity -ge 28 && $batstat != "Charging" ) ]];
then
    notify-send -u critical "BATTERY LOW: $capacity%"
fi

if [[ ( $capacity -le 15 && $batstat != "Charging" ) && ($capacity -ge 13 && $batstat != "Charging" ) ]];
then
    notify-send -u critical "BATTERY CRITICAL: $capacity%"
fi
exit
