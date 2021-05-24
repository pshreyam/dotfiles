#!/bin/sh

res="$(echo -e "Yes\nNo" | rofi -dmenu -p "Are you sure you want to log off" -i)"

if [[ "$res" == "Yes" ]]; then
    bspc quit
fi
