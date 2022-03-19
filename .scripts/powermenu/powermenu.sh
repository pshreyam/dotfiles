#!/bin/bash

res="$(printf " Logout\n Shutdown\n Reboot" | rofi -no-default-config -dmenu -p "Power Menu ›" -i)"

if [ "$res" == " Logout" ]; then
    ~/.scripts/powermenu/logout.sh
elif [ "$res" == " Shutdown" ]; then
    ~/.scripts/powermenu/shutdown.sh
elif [ "$res" == " Reboot" ]; then
    ~/.scripts/powermenu/reboot.sh
fi
