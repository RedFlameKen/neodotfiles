#!/bin/bash

prev="$(cat /sys/class/power_supply/BAT0/capacity)"

check(){
    capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ $capacity -gt $prev ]; then
        prev=$capacity
        printf "%d\n" $capacity
    fi
    if [ $capacity -ge 99 ]; then
        shutdown now

    fi
}

while true; do 
    check
    sleep 2
done
