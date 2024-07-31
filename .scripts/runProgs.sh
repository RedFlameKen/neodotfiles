#!/bin/bash

#reset programs before running again
killall blueman-applet
killall nm-applet
killall dunst
killall lowbatNotif.sh

initPicom(){
    killall picom
    picom &
}

#activate compositor
if [ "$1" == "picom" ]; then
    initPicom
fi

blueman-applet &
nm-applet &
dunst &
$HOME/.scripts/lowbatNotifd.sh &

bluetoothctl power off
