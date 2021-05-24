#!/bin/bash

CURR_WALL=~/Pictures/wallpapers/current_wallpaper

REPLY=$(echo -e "$(ls -1v ~/Pictures/wallpapers -I current_wallpaper)" \
    | rofi -dmenu -i -p "Wallpaper")
WALL="/home/shreyam/Pictures/wallpapers/$REPLY"

if [[ -z "$REPLY" ]];then
    notify-send "No wallpaper selected!" --urgency=low
else
    rm $CURR_WALL
    ln -s $WALL $CURR_WALL 
    feh --bg-fill $CURR_WALL 
    notify-send "Wallpaper Changed" "Wallpaper -> $WALL"
fi
