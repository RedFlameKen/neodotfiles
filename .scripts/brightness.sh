#!/bin/bash

while getopts "ud" option; do
	case $option in
		u)
			sudo brightnessctl set +2%
			;;
		d)
			sudo brightnessctl set 2%-
			;;
		*)
			echo "Usage: brightness.sh [-u up] [-d down]"
			exit 1
			;;
	esac
done


