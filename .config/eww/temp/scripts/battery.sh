#!/bin/bash

batstat(){
    stat="$(cat "/sys/class/power_supply/BAT1/status")"
    per="$(cat "/sys/class/power_supply/BAT1/capacity")"
    if [ $stat == "Charging" ]
    then
	echo true
    elif [ $stat == "Full" ]
    then
	echo Full
    else
	if [ $per -le 30 ]
	then
	    echo Low
	else
	    echo false
	fi
    fi
    while true; do
	sleep 5
	newstat="$(cat "/sys/class/power_supply/BAT1/status")"
	newper="$(cat "/sys/class/power_supply/BAT1/capacity")"
	if [ "$stat" == "$newstat" ] && ["$per" == "$newper" ]
	then
	    continue
	else
	    stat=$newstat
	    per=$newper
	    if [ $stat == "Charging" ]
	    then
		echo true
	    elif [ $stat == "Full" ]
	    then
		echo Full
	    else
		if [ $per -le 30 ]
		then
		    echo Low
		else
		    echo false
		fi
	    fi
	fi
    done
}

icon=""

getIcon(){
    [ $2 = Charging ] || [ $2 = Full ] && echo "󰂄" && return

    if [ "$1" -gt "90" ]
    then
	icon="󰁹"
    elif [ "$1" -gt "80" ]
    then
	icon="󰂂"
    elif [ "$1" -gt "70" ]
    then
	icon="󰂁"
    elif [ "$1" -gt "60" ]
    then
	icon="󰂀"
    elif [ "$1" -gt "50" ]
    then
	icon="󰁿"
    elif [ "$1" -gt "40" ]
    then
	icon="󰁾"
    elif [ "$1" -gt "30" ]
    then
	icon="󰁽"
    elif [ "$1" -gt "20" ]
    then
	icon="󰁻"
    elif [ "$1" -gt "10" ]
    then
	icon="󰁺"
    elif [ "$1" -gt "0" ]
    then
	icon="󰂃"
    else
	echo 󰂃 && return
    fi
    echo $icon
}

icon() {
    stat="$(cat "/sys/class/power_supply/BAT1/status")"
    per="$(cat "/sys/class/power_supply/BAT1/capacity")"
    getIcon $per $stat
    while true; do
	sleep 5
	newstat="$(cat "/sys/class/power_supply/BAT1/status")"
	newper="$(cat "/sys/class/power_supply/BAT1/capacity")"
	if [ "$newstat" == "$stat" ] && [ "$per" == "$newper" ]
	then
	    continue
	else
	    stat=$newstat
	    per=$newper
	    getIcon $per $stat
	    
	fi
    done
}

percent(){
    per="$(cat "/sys/class/power_supply/BAT1/capacity")"

    echo $per
    while true; do
	sleep 5
	newper="$(cat "/sys/class/power_supply/BAT1/capacity")"
	if [ $per == $newper ]
	then
	    continue
	else
	    per=$newper
	    
	    echo $per
	fi
    done
}

[ "$1" = "icon" ] && icon && exit
[ "$1" = "percent" ] && percent && exit
[ "$1" = "status" ] && batstat && exit
[ "$1" = "class" ] && batClass && exit
exit
