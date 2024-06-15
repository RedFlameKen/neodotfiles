#!/bin/bash

#reset programs before running again
killall blueman-applet
killall nm-applet
killall dunst
killall lowbatNotif.sh

sleep 1
#activate compositor
#picom --experimental-backends & 
blueman-applet &
nm-applet &
dunst &
$HOME/.scripts/lowbatNotifd.sh &

bluetoothctl power off
exit
