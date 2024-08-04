#!/bin/bash

[ "$1" = "record" ] && [ "$2" = "pause" ] && obs-cli --password "$(cat ~/docs/obs-cli)" recording pause toggle && exit
[ "$1" = "record" ] && obs-cli --password "$(cat ~/docs/obs-cli)" recording toggle && exit
[ "$1" = "stream" ] && obs-cli --password "$(cat ~/docs/obs-cli)" stream toggle && exit
