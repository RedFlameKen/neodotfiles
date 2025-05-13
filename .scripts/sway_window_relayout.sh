#!/bin/bash

sway_pid=$(pgrep -x sway | wc -l)
if [ $sway_pid -lt 1 ]; then
    printf "There is no sway instance running\n"
    exit;
fi

monitor_height=$(swaymsg -t get_outputs | jq '.[] | select(.focused==true) .current_mode.width')

sway_resize_window(){
    swaymsg "resize set width $1 px"
}

tex_layout(){
    new_width=$(calc "round($monitor_height*0.64)")
    sway_resize_window $new_width
}

half_layout(){
    new_width=$(calc "round($monitor_height*0.50)")
    sway_resize_window $new_width
}

[ "$1" = "tex" ] && tex_layout && exit
[ "$1" = "half" ] && half_layout && exit
exit
