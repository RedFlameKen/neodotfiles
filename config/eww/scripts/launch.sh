#!/bin/bash

# sleep 4

killall eww

eww daemon

sleep 5

# ~/.config/eww/scripts/initVars.sh

eww update vol_level=$(pamixer --get-volume)
eww update mic_level=$(pamixer --default-source --get-volume)

sleep 2

eww open bar

exit
