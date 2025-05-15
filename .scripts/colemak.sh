#!/bin/bash

git checkout colemak

sway_pid=$(pgrep sway | wc -l)
if [ $sway_pid -ge 1 ]; then
    swaymsg "reload"
fi

tmux_pid=$(pgrep tmux | wc -l)
if [ $tmux_pid -ge 1 ]; then
    tmux source ~/.config/tmux/tmux.conf
fi

