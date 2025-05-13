#!/bin/bash

waybar_instances=$(pgrep waybar | wc -l)

if [ $waybar_instances -ge 1 ]; then
    killall waybar
else
    waybar
fi
