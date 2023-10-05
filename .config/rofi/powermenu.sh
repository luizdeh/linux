#!/bin/bash

#--------------------------------------powermenu

# options to be displayed
option0=" shutdown"
option1=" reboot"
option2=" lock"
option3=" suspend"
option4=" logout"

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4"

# menu
chosen="$(echo -e "$options" | rofi -theme ~/.config/rofi/powermenu.rasi -dmenu)"
case $chosen in
$option0)
	systemctl poweroff
	;;
$option1)
	systemctl reboot
	;;
$option2)
	sh ~/projects/lock.sh
	;;
$option3)
	mpc -q pause
	amixer set Master mute
	sh ~/projects/lock.sh
	systemctl suspend
	;;
$option4)
	i3-msg exit
	;;
esac
