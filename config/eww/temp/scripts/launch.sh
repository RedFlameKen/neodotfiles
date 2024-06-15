#!/bin/bash

killall eww

sleep 1

eww daemon

sleep 1

eww update vol_level=$(pamixer --get-volume) &
eww update mic_level=$(pamixer --default-source --get-volume) &

sleep 2

eww open bar

exit
