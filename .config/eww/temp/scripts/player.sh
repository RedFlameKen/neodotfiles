#!/bin/bash

pos=""

openWindow(){
    ewwStatus="$(eww active-windows | grep 'playerWindow')"

    if [ "$ewwStatus" == "playerWindow: playerWindow" ]
    then
	eww close playerWindow &
    else 
	eww open playerWindow &
    fi
}

artist(){
    songArtist="$(playerctl metadata artist)"
    if [ "$songArtist" == "" ]
    then
	echo Launcher
    else
	echo "󰝚 $songArtist"
    fi
    while true; do 
	sleep 2
	new_songArtist="$(playerctl metadata artist)"
	if [ $new_songArtist == $songArtist ]
	then
	    continue
	else
	    songArtist=$new_songArtist
	    if [ "$songArtist" == "" ]
	    then
		echo Launcher
	    else
		echo "󰝚 $songArtist"
	    fi
	fi
    done
    
}

image(){
    songArt="$(playerctl metadata mpris:artUrl | sed 's/file:\/\/\//\//')"
    echo $songArt
    while true; do
	sleep 2
	new_songArt="$(playerctl metadata mpris:artUrl | sed 's/file:\/\/\//\//')"
	if [ $new_songArt == $songArt ]
	then
	    continue
	else
	    songArt=$new_songArt
	    echo $songArt
	fi


    done
}

changePos(){
    length=$(playerctl metadata mpris:length)
    pos=$(calc $pos / 100 | sed 's/\t~//')

    calcStr="$pos * $(( length / 1000000 ))"
    newpos=$(calc "$calcStr" | sed 's/\t~//')
    playerctl position $newpos
}
position(){
    length=$(playerctl metadata mpris:length)
    curPos=$(playerctl position)
    calcStr="($curPos / $((length / 1000000))) * 100"

    posPercentage="$(calc "$calcStr" | sed 's/\t~//')"
    echo $posPercentage
    while true;do
	sleep 1
	length=$(playerctl metadata mpris:length)
	curPos=$(playerctl position)
	calcStr="($curPos / $((length / 1000000))) * 100"
	new_posPercentage="$(calc "$calcStr" | sed 's/\t~//')"
	if [ $new_posPercentage == $posPercentage ] 
	then
	    continue
	else
	    posPercentage=$new_posPercentage
	    echo $posPercentage
	fi
    done

}
pausePlay(){
    status=$(playerctl status)

    if [ "$status" == "Playing" ]
    then
	playerctl pause
    else
	playerctl play
    fi
}

[ "$1" = "artist" ] && artist && exit
[ "$1" = "image" ] && image && exit
[ "$1" = "changePos" ] && pos=$2 && changePos && exit 
[ "$1" = "position" ] && position && exit 
[ "$1" = "pausePlay" ] && pausePlay && exit
[ "$1" = "openWindow" ] && openWindow && exit
exit
