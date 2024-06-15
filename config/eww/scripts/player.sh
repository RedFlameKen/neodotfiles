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
	echo "Nothing Playing"
    else
	echo "$songArtist"
    fi
    while true; do 
	sleep 5s
	new_songArtist="$(playerctl metadata artist)"
	if [ $new_songArtist == $songArtist ]
	then
	    continue
	else
	    songArtist=$new_songArtist
	    if [ "$songArtist" == "" ]
	    then
		echo "Nothing Playing"
	    else
		echo "$songArtist"
	    fi
	fi
    done
    
}

title(){
    songTitle="$(playerctl metadata title)"
    if [ "$songTitle" != "" ]
    then
	echo "$songTitle"
    fi
    while true; do 
	sleep 5s
	new_songTitle="$(playerctl metadata title)"
	if [ $new_songTitle == $songTitle ]
	then
	    continue
	else
	    songTitle=$new_songTitle
	    if [ "$songTitle" == "" ]
	    then
		echo "$songTitle"
	    fi
	fi
    done
    
}
image(){
    songArt="$(playerctl metadata mpris:artUrl | sed 's/file:\/\/\//\//')"
    echo $songArt
    while true; do
	sleep 2s
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
	sleep 1s
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
[ "$1" = "title" ] && title && exit
[ "$1" = "image" ] && image && exit
[ "$1" = "changePos" ] && pos=$2 && changePos && exit 
[ "$1" = "position" ] && position && exit 
[ "$1" = "pausePlay" ] && pausePlay && exit
[ "$1" = "openWindow" ] && openWindow && exit
exit
