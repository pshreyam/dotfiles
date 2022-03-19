#!/bin/bash

res="$(printf "No\nYes" | rofi -no-default-config -dmenu -p "Log Out?" -i)"

if [ "$res" == "Yes" ]; then
    bspc quit
fi
