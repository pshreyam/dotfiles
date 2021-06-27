#!/bin/bash

CURR_WALL=/home/shreyam/Pictures/wallpapers/current_wallpaper

REPLY=$(ls -1v ~/Pictures/wallpapers -I current_wallpaper | shuf -n 1)
WALL="/home/shreyam/Pictures/wallpapers/$REPLY"

if [[ -z "$REPLY" ]];then
    echo "Not changed"
else
    rm $CURR_WALL
    ln -s $WALL $CURR_WALL 
    feh --bg-fill $CURR_WALL 
    echo "Wallpaper Changed"
fi
