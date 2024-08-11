#!/bin/bash
wallpaper="wp0"
theme="0"

default(){
    wallpaper="wp0"
    theme="0"
    echo 0 > ~/.scripts/curwp
}
pink(){
    wallpaper="wp1"
    theme="1"
    echo 1 > ~/.scripts/curwp
}
gray(){
    wallpaper="wp3"
    theme="3"
    echo 2 > ~/.scripts/curwp
}
green(){
    wallpaper="wp4"
    theme="4"
    echo 3 > ~/.scripts/curwp
}
orange(){
    wallpaper="wp7"
    theme="7"
    echo 4 > ~/.scripts/curwp
}
starforce(){
    wallpaper="wp9"
    theme="9"
    echo 5 > ~/.scripts/curwp
}
mascot(){
    wallpaper="wp10"
    theme="10"
    echo 6 > ~/.scripts/curwp
}
random(){
    randomNum=$(($RANDOM % 6))
    curThemeFile="~/.scripts/curwp"
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
    curThemeFile=$(cat ~/.scripts/curwp)
    
    if [ $curThemeFile -ge 6 ]
    then
	echo "0" > ~/.scripts/curwp
	curThemeFile=0
    else
	curThemeFile=$((curThemeFile + 1))
	echo $curThemeFile > ~/.scripts/curwp
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

killall swaybg
numberFunc(){
    swaybg -m fill -i ~/.wallpapers/wp$1.jpg &
    echo $1 > ~/.scripts/curwp
}

[ "$1" = "num" ] && numberFunc $2 && exit

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
swaybg -m fill -i ~/.wallpapers/$wallpaper.jpg &
