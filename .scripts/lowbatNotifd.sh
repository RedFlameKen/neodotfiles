#!/bin/bash

virgin=true
notified=false

battery=BAT0
lower=10
low=20



notifyCheck(){
    capacity=$(cat /sys/class/power_supply/$battery/capacity)
    batstat=$(cat /sys/class/power_supply/$battery/status)

    if [[ ( $capacity -le $low && $batstat == "Charging" ) && ($capacity -ge $((low - 1)) && $batstat == "Charging" ) ]];
    then
        notified=false
        return
    fi
    if [[ ( $capacity -le $lower && $batstat == "Charging" ) && ($capacity -ge $((lower - 1)) && $batstat == "Charging" ) ]];
    then
        notified=false
        return
    fi
    if [[ "$notified" = true && "$virgin" = false ]];
    then
        return
    fi
    if [[ ( $capacity -le $low && $batstat != "Charging" ) && ($capacity -ge $((low - 1)) && $batstat != "Charging" ) ]];
    then
        notify-send -u critical "DUMBASS! DON'T FORGET TO CHARGE!: $capacity%"
        if [[ "$virgin" == "true" ]]
        then 
            virgin=false 
        fi
        notified=true
        return
    fi

    if [[ ( $capacity -le $lower && $batstat != "Charging" ) && ($capacity -ge $((lower - 1)) && $batstat != "Charging" ) ]];
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
