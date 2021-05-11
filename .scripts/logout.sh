#!/bin/sh

res="$(echo -e "Yes\nNo" | rofi -dmenu -p "Are you sure you want to log off" -i -lines 1 -columns 2 -width 400)"

if [[ "$res" == "Yes" ]]; then
    bspc quit
fi
