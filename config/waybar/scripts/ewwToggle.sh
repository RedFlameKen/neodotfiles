#!/bin/bash

ewwStatus="$(eww active-windows)"

if [ "$ewwStatus" == "dateWindow: dateWindow" ];
then
    eww close-all
else
    eww open dateWindow &
fi

exit
