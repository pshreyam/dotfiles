#!/bin/bash

res="$(printf "No\nYes" | rofi -no-default-config -dmenu -p "Shutdown?" -i)"

if [ "$res" == "Yes" ]; then
    /sbin/poweroff
fi
