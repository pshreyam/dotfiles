#!/bin/bash

res="$(printf " Lock\n Logout\n Shutdown\n Reboot" | rofi -no-default-config -dmenu -p "Power Menu ›" -i)"

if [ "$res" == " Lock" ]; then
    betterlockscreen -l blur
elif [ "$res" == " Logout" ]; then
    ~/.scripts/powermenu/logout.sh
elif [ "$res" == " Shutdown" ]; then
    ~/.scripts/powermenu/shutdown.sh
elif [ "$res" == " Reboot" ]; then
    ~/.scripts/powermenu/reboot.sh
fi
