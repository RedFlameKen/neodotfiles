#!/usr/bin/env bash

bar_open=$(eww active-windows | grep bar)

if [[ -z $bar_open ]]; then
    eww open bar
else
    eww close bar
fi


