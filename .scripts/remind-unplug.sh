#!/bin/bash

notified=false
battery=BAT0

alarm_point=95

interval=15

notify(){
    notify-send -u critical "REMOVE THE GOD DAMN CHARGER"
    ffplay -nodisp -autoexit ~/.dotfiles/res/sounds/lowbat_sound.wav
}

constant_notif(){
    while true; do
        notify
        sleep 1
    done
}

check(){
    capacity=$(cat /sys/class/power_supply/$battery/capacity)
    batstat=$(cat /sys/class/power_supply/$battery/status)
    if [ $batstat != "Charging" ]; then
        exit
    fi
    if [ $capacity -ge $alarm_point ]; then
        constant_notif
    fi
}

while true; do
    check
    sleep $interval
done
