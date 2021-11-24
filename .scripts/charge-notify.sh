#!/bin/bash

low_battery_threshold=25

battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
plugged=$(acpi -b | grep -c "Charging")
full=$(acpi -b | grep -c "Full")

if [[ $battery_level -le $low_battery_threshold && $plugged -eq 0 ]];then
    XDG_RUNTIME_DIR=/run/user/$(id -u) \
        notify-send "Low Battery" "$battery_level%\nPlug in the charger!" -u critical
fi
