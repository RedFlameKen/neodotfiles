#!/bin/bash

reload_systems(){
    sway_pid=$(pgrep sway | wc -l)
    if [ $sway_pid -ge 1 ]; then
        swaymsg "reload"
    fi

    tmux_pid=$(pgrep tmux | wc -l)
    if [ $tmux_pid -ge 1 ]; then
        tmux source-file ~/.config/tmux/tmux.conf
    fi
}

git_checkout(){
    git -C ~/.dotfiles checkout $1
    reload_systems
}

to_qwerty(){
    git_checkout "master"
}

to_colemak(){
    git_checkout "colemak"
}

[ "$1" = "qwerty" ] && to_qwerty && exit
[ "$1" = "colemak" ] && to_colemak && exit

display_layout(){
    is_active=""
    if [ $2 == true ]; then
        is_active="*"
    fi
    printf "$1 $is_active\n"
}

display_current_layout(){
    is_qwerty_active=false
    is_colemak_active=false
    current_branch="$(git -C ~/.dotfiles branch --show-current)"
    if [ "$current_branch" == "master" ]; then
        is_qwerty_active=true
    fi
    if [ "$current_branch" == "colemak" ]; then
        is_colemak_active=true
    fi
    display_layout "qwerty" $is_qwerty_active
    display_layout "colemak" $is_colemak_active
}

display_current_layout
