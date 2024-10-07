#!/bin/bash

notifiedLow="false"
notifiedVeryLow="false"

interval=15

battery=BAT0
lastCheck=$(cat /sys/class/power_supply/$battery/status)

veryLow=10
low=20

notify(){
    notify-send -u critical "DUMBASS! DON'T FORGET TO CHARGE!: $1%"
}

check(){
    capacity=$(cat /sys/class/power_supply/$battery/capacity)
    batstat=$(cat /sys/class/power_supply/$battery/status)

    if [ $batstat == "Charging" ]; then
        if [ $lastCheck == "Discharging" ]; then
            notifiedLow="false"
            notifiedVeryLow="false"
            lastCheck="Charging" 
        fi
        return
    fi

    if [ $batstat == "Discharging" ]; then
        if [ $capacity -le $veryLow ] && [ "$notifiedVeryLow" == "false" ]; then
            notify $capacity
            notifiedVeryLow="true"
        elif [ $capacity -le $low ] && [ $capacity -gt $veryLow ] && [ "$notifiedLow" == "false" ]; then
            notify $capacity
            notifiedLow="true"
        fi
        if [ lastCheck != "Discharging" ]; then
            lastCheck="Discharging" 
        fi
    fi

}

while true; do
    check;
    sleep $interval
done

exit
