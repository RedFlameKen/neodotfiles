#!/bin/bash

wallpaper="wp0"
theme="0"

default(){
    wallpaper="wp0"
    theme="0"
    echo 0 > curwp
}
pink(){
    wallpaper="wp1"
    theme="0"
    echo 1 > curwp
}
gray(){
    wallpaper="wp3"
    theme="3"
    echo 2 > curwp
}
green(){
    wallpaper="wp4"
    theme="4"
    echo 3 > curwp
}
orange(){
    wallpaper="wp7"
    theme="7"
    echo 4 > curwp
}
starforce(){
    wallpaper="wp9"
    theme="9"
    echo 5 > curwp
}
mascot(){
    wallpaper="wp10"
    theme="10"
    echo 6 > curwp
}
random(){
    randomNum=$(($RANDOM % 6))
    curThemeFile="curwp"
    while [ $randomNum == $(cat $curThemeFile) ]
    do
	randomNum=$(($RANDOM % 6))
    done
    if [ $randomNum == "0" ]
    then
	default 
    elif [ $randomNum == "1" ]
    then
	pink 
    elif [ $randomNum == "2" ]
    then
	gray
    elif [ $randomNum == "3" ]
    then
	green
    elif [ $randomNum == "4" ]
    then
	orange
    elif [ $randomNum == "5" ]
    then
	starforce
    elif [ $randomNum == "6" ]
    then
	mascot
    fi
}
increment(){
    curThemeFile=$(cat curwp)
    
    if [ $curThemeFile -ge 6 ]
    then
	echo "0" > curwp
	curThemeFile=0
    else
	curThemeFile=$((curThemeFile + 1))
	echo $curThemeFile > curwp
    fi
    if [ $curThemeFile == "0" ]
    then
	default
    elif [ $curThemeFile == "1" ]
    then
	pink
    elif [ $curThemeFile == "2" ]
    then
	gray
    elif [ $curThemeFile == "3" ]
    then
	green
    elif [ $curThemeFile == "4" ]
    then
	orange
    elif [ $curThemeFile == "5" ]
    then
	starforce
    elif [ $curThemeFile == "6" ]
    then
	mascot
    fi
}

while getopts "abcdefir" flag; do
    case "${flag}" in
	a)
	    default
	    ;;
	b)
	    pink
	    ;;
	c)
	    gray
	    ;;
	d)
	    green
	    ;;
	e)
	    orange
	    ;;
	f)
	    starforce
	    ;;
	i)
	    increment
	    ;;
	r)
	    random
	    ;;
	*)
	    exit 1
	    ;;
    esac
done

sleep 1
swww img -t grow --transition-duration 1 --transition-pos top-right "$HOME/.wallpapers/$wallpaper.jpg" 
