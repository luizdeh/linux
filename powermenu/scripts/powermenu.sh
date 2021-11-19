#!/bin/bash

# options to be displayed
option0="lock"
option1="logout"
option2="suspend"
option3="reboot"
option4="shutdown"

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4"

chosen="$(echo -e "$options" | rofi -lines 5 -dmenu -p "power")"
case $chosen in
    $option0)
        i3lock -i ~/Images/Wallpapers/dlanham-NightOwl.png;;
    $option1)
        i3-msg exit;;
    $option2)
        systemctl suspend;;
    $option3)
        systemctl reboot;;
    $option4)
        systemctl poweroff;;
esac
