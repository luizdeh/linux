#!/usr/bin/env bash

#---------------------------------------------screenshot

# options to be displayed
option0=" area"
option1=" window"
option2=" screen"

# options passed into variable
options="$option0\n$option1\n$option2"

# menu
chosen="$(echo -e "$options" | rofi -theme ~/.config/rofi/screenshot.rasi -dmenu)"
case $chosen in
    $option0)
        sleep 1; scrot -s ~/Images/Screenshots/%Y.%m.%d_%H.%M.%S.png;;
    $option1)
        sleep 1; scrot -u ~/Images/Screenshots/%Y.%m.%d_%H.%M.%S.png;;
    $option2)
        sleep 1; scrot ~/Images/Screenshots/%Y.%m.%d_%H.%M.%S.png;;
esac
