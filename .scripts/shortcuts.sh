#!/bin/bash

cat ~/.config/sxhkd/sxhkdrc | awk '/^[a-zA-Z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' | column -t -s $'\t' | rofi -no-default-config -dmenu -p "Shortcuts" -fullscreen -i
