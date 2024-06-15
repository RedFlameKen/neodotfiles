#!/bin/bash

eww update vol_level=$(pamixer --get-volume) &
eww update mic_level=$(pamixer --default-source --get-volume) &
