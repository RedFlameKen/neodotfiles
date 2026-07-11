#!/bin/bash

#reset programs before running again
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

dunst &
# $HOME/.scripts/lowbatNotifd.sh &
$HOME/.local/bin/lowbatNotifd BAT0

bluetoothctl power off
