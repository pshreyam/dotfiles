#!/bin/sh

res="$(echo -e "Yes\nNo" | rofi -no-default-config -dmenu -p "Log Out?" -i)"

if [[ "$res" == "Yes" ]]; then
    bspc quit
fi
