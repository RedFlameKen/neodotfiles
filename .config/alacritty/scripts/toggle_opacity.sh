#!/bin/bash

if [ ! -f $HOME/.local/state/alacritty_opaque ]; then
    echo "1" > $HOME/.local/state/alacritty_opaque
fi

is_opaque=$(cat $HOME/.local/state/alacritty_opaque)

if [ $is_opaque -eq 1 ]; then
    alacritty msg config 'window.opacity=1'
    echo "0" > $HOME/.local/state/alacritty_opaque
elif [ $is_opaque -eq 0 ]; then
    alacritty msg config 'window.opacity=0.9'
    echo "1" > $HOME/.local/state/alacritty_opaque
fi
