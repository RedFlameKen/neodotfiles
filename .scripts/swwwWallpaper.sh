#!/bin/bash

if [ ! -f ~/.local/state/curwp ]; then
    touch ~/.local/state/curwp
    echo "13" > ~/.local/state/curwp
fi

set_wp(){
    echo "setting wallpaper..."
    swww img -t grow --transition-duration 1 --transition-pos top-right ~/.wallpapers/wp$1.*
    echo $1 > ~/.local/state/curwp
}

num_mode(){
    if [ ! -f ~/.wallpapers/wp$1.jpg ]; then
        echo "that wallpaper does not exist! terminating!"
        return
    fi
    set_wp $1
}

cur_mode(){
    set_wp $(cat ~/.local/state/curwp)
}

next_mode(){
    target_wp=$(($(cat ~/.local/state/curwp)+1))
    if [ $target_wp -gt $(($(ls ~/.wallpapers | wc -l)-1)) ]; then
        target_wp=0
    fi
    set_wp $target_wp
}

prev_mode(){
    target_wp=$(($(cat ~/.local/state/curwp)-1))
    if [ $target_wp -lt 0 ]; then
        target_wp=$(($(ls ~/.wallpapers | wc -l)-1))
    fi
    set_wp $target_wp
}

rand_mode(){
    wpCount=$(ls ~/.wallpapers | wc -l)
    randomNumber=$(($RANDOM % $wpCount))
    while [ $randomNumber -eq $(cat ~/.local/state/curwp) ]; do
        randomNumber=$(($RANDOM % $wpCount))
    done
    set_wp $randomNumber
}

print_help(){

echo "
Usage: 
swwwWallpaper [num <number>|cur|next|prev|rand|help]

num
    select a sepecific number of a wallpaper from ~/.wallpapers

    Example:
    swwwWallpaper num 13

    this will set the wallpaper to ~/.wallpapers/wp13.jpg

cur
    sets the wallpaper to the current number written in ~/.local/state/curwp

    usually used as a startup option when using next and prev

next
    sets the wallpaper to the number in curwp+1

    if number is greater than the number of wallpapers in ~/.wallpapers -1, this sets the
    wallpaper to 0

next
    sets the wallpaper to the number in curwp-1

    if the number is less than 0, this sets the wallpaper to the number of wallpapers
    ~/.wallpapers -1

rand
    sets the wallpaper to a random wallpaper in ~/.wallpapers

help
    prints this help message
"
}

[ "$1" = "num" ] && num_mode $2 && exit
[ "$1" = "cur" ] && cur_mode && exit
[ "$1" = "next" ] && next_mode && exit
[ "$1" = "prev" ] && prev_mode && exit
[ "$1" = "rand" ] && rand_mode && exit
[ "$1" = "help" ] && print_help && exit

echo "invalid usage!

Usage:
swwwWallpaper [num <number>|cur|next|prev|rand|help]

options:
    num <number>    -- sets the wallpaper to the entered number
    cur             -- sets the wallpaper to the currently tracked wallpaper
    next            -- sets the wallpaper to the next wallpaper
    next            -- sets the wallpaper to the previous wallpaper
    rand            -- sets the wallpaper to a random wallpaper
    help            -- prints help
"

