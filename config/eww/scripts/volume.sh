#!/bin/bash


muted(){
    curMuted=$(pamixer --get-mute)
    echo $curMuted
    while true; do
	sleep 0.5
	new_curMuted=$(pamixer --get-mute)
	if [ $new_curMuted == $curMuted ]
	then
	    continue
	else
	    curMuted=$new_curMuted
	    echo $curMuted
	fi
    done
    
#    newvolstat="$(amixer -D pulse sget Master | grep 'Left:' | awk -F '[][]' '{print $4}')"
#
#    if [ $newvolstat == "off" ]
#    then
#	echo muted
#    else
#	echo "$volume%"
#    fi
}


percent(){
    volume="$(pamixer --get-volume)"
    muted="$(pamixer --get-mute)"
    if [ $muted == "true" ]
    then
	echo muted
    else
	echo "$volume%"
    fi
    while true; do
	sleep 1s
	newvolume="$(pamixer --get-volume)"
	newmuted="$(pamixer --get-mute)"
	if [ $newvolume == $volume ] && [ $newmuted == $muted ]
	then
	    continue
	else
	    if [ $newmuted == "true" ]
	    then
		echo muted
	    else
		echo "$newvolume%"
	    fi
	    volume=$newvolume
	    muted=$newmuted
	fi
    done
}

icon(){
    volume="$(pamixer --get-volume)"
    muted="$(pamixer --get-mute)"
    if [ $muted == "true" ]
    then
	icon="󰝟"
    elif [ $volume -gt "66" ]
    then
	icon="󰕾"
    elif [ $volume -gt "33" ]
    then
	icon=""
    elif [ $volume -gt "0" ]
    then
	icon=""
    else
	icon="󰝟"
    fi
    
    echo $icon
    while true; do
	sleep 0.5
	newvolume="$(pamixer --get-volume)"
	newmuted="$(pamixer --get-mute)"
	if [ $newvolume == $volume ] && [ $newmuted == $muted ]
	then
	    continue
	else
	    if [ $newmuted == "true" ]
	    then
		icon="󰝟"
	    elif [ $newvolume -gt "66" ]
	    then
		icon="󰕾"
	    elif [ $newvolume -gt "33" ]
	    then
		icon=""
	    elif [ $newvolume -gt "0" ]
	    then
		icon=""
	    else
		icon="󰝟"
	    fi
	    
	    echo $icon
	    volume=$newvolume
	    muted=$newmuted
	fi
    done
}
up(){
    pactl set-sink-volume @DEFAULT_SINK@ +5% 
#    pamixer --increase 5
    eww update vol_level=$(pamixer --get-volume)
}

down(){
    pactl set-sink-volume @DEFAULT_SINK@ -5% 
#    pamixer --decrease 5
    eww update vol_level=$(pamixer --get-volume)
}

[ "$1" = "up" ] && up && exit
[ "$1" = "down" ] && down && exit
[ "$1" = "icon" ] && icon && exit
[ "$1" = "percent" ] && percent && exit
[ "$1" = "muted" ] && muted && exit
exit
