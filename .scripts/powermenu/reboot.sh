#!/bin/sh

res="$(echo -e "Yes\nNo" | rofi -no-default-config -dmenu -p "Reboot?" -i)"

if [[ "$res" == "Yes" ]]; then
    /sbin/reboot
fi
