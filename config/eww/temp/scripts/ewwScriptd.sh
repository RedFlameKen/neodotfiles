#!/bin/bash

batstat(){
}

getIcon(){
}

bat_icon(){
}

bat_percent(){
}

muted(){
}

vol_percent(){
}

vol_icon(){
}

updateEww(){
    eww update $1=$2
}
mainLoop(){
    curMuted=$(pamixer --get-mute)
    updateEww muted $curMuted
    while true; do
	sleep 5
    done
}

