#!/usr/bin/dash

FILENAME="/tmp/temp_sp_lock$(date +%s_%Y-%h-%d_%H:%M:%S).png"
LOCKSCREEN="/tmp/current_lockscreen"
PADLOCK_IMAGE="/home/shreyam/.assets/lock.png"

# Notify the user about locking status
notify-send "Locking screen. Please wait..."

# Removing the earlier screenshot
rm -rf /tmp/temp_sp_lock*.png

# Take the screenshot
maim -u $FILENAME

# Blur the screenshot
convert -blur 0x30 $FILENAME $LOCKSCREEN

# Add padlock icon to the blurred screenshot
convert -composite -gravity center $LOCKSCREEN $PADLOCK_IMAGE $LOCKSCREEN

# Lock the screen with the resulting image
i3lock -i $LOCKSCREEN
