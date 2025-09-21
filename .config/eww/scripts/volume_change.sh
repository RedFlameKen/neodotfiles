#!/usr/bin/env bash

device=$1
step=$2
direction=$3

if [[ $direction == "up" ]]; then
    operation="+"
elif [[ $direction == "down" ]]; then
    operation="-"
fi

sink_vol(){
    pactl set-sink-volume @DEFAULT_SINK@ "$operation$step%"
}

source_vol(){
    pactl set-source-volume @DEFAULT_SOURCE@ "$operation$step%"
}

if [[ $device == "mic" ]]; then
    source_vol
elif [[ $device == "sink" ]]; then
    sink_vol
fi
