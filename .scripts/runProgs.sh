#!/bin/bash

#reset programs before running again
killall blueman-applet
killall nm-applet
killall dunst
killall lowbatNotifd

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
# $HOME/.scripts/lowbatNotifd.sh &
$HOME/.local/bin/lowbatNotifd BAT0

bluetoothctl power off
