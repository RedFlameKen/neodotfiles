#!/bin/bash

virgin=true
notified=false

notifyCheck(){
    capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    batstat=$(cat /sys/class/power_supply/BAT1/status)

    if [[ ( $capacity -le 30 && $batstat == "Charging" ) && ($capacity -ge 28 && $batstat == "Charging" ) ]];
    then
        notified=false
        return
    fi
    if [[ ( $capacity -le 15 && $batstat == "Charging" ) && ($capacity -ge 13 && $batstat == "Charging" ) ]];
    then
        notified=false
        return
    fi
    if [[ "$notified" = true && "$virgin" = false ]];
    then
        return
    fi
    if [[ ( $capacity -le 30 && $batstat != "Charging" ) && ($capacity -ge 28 && $batstat != "Charging" ) ]];
    then
        notify-send -u critical "DUMBASS! DON'T FORGET TO CHARGE!: $capacity%"
        if [[ "$virgin" == "true" ]]
        then 
            virgin=false 
        fi
        notified=true
        return
    fi

    if [[ ( $capacity -le 15 && $batstat != "Charging" ) && ($capacity -ge 13 && $batstat != "Charging" ) ]];
    then
        notify-send -u critical "DUMBASS! DON'T FORGET TO CHARGE!: $capacity%"
        notified=true
        if [[ "$virgin" == "true" ]]
        then 
            virgin=false 
        fi
        return
    fi
}
while true; do
    sleep 5
    notifyCheck;
done

exit
