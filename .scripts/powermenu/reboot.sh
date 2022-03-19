#!/bin/bash

res="$(printf "No\nYes" | rofi -no-default-config -dmenu -p "Reboot?" -i)"

if [ "$res" == "Yes" ]; then
    /sbin/reboot
fi
