#!/bin/bash

ans="/home/shreyam/Pictures/wallpapers/$(echo -e "$(ls -1v ~/Pictures/wallpapers -I current_wallpaper.jpg)" | rofi -dmenu -i -p "Background")"
echo "Copying $ans to ~/Pictures/wallpapers/current_wallpaper.jpg"
cp "$ans" ~/Pictures/wallpapers/current_wallpaper.jpg
feh --bg-fill ~/Pictures/wallpapers/current_wallpaper.jpg
