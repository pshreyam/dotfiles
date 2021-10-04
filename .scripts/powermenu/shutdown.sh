#!/bin/sh

res="$(echo -e "Yes\nNo" | rofi -no-default-config -dmenu -p "Shutdown?" -i)"

if [[ "$res" == "Yes" ]]; then
    poweroff
fi
