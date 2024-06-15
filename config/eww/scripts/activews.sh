#!/bin/bash

ws=$(hyprctl activeworkspace | awk -F '[()]' '{print $2}')

exit $((ws))
