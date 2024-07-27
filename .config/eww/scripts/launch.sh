#!/bin/bash

# sleep 4

killall eww

eww daemon

sleep 5

# ~/.config/eww/scripts/initVars.sh

eww update vol_level=$(pamixer --get-volume)
# eww update mic_level=$(pamixer --default-source --get-volume)
eww update vol_level=$(pactl get-sink-volume $(pactl get-default-sink) | awk -F '[//]' '{print $2}' | tr -d '\ %')
sleep 2

eww open bar

exit
