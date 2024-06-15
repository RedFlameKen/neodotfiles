#!/bin/bash

ewwStatus="$(eww active-windows | grep "$1")"

if [ "$ewwStatus" == "$1: $1" ]
then
    eww close $1 &
else
    eww open $1 &
fi

exit
