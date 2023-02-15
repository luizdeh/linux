#!/usr/bin/env bash

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar --reload main &

# output=$(xrandr --query | grep " connected" | cut -d" " -f1)
#
# if type "xrandr">/dev/null; then
#   for m in $output; do
#     if [ $m == 'HDMI1']; then
#       MONITOR=$m polybar --reload main &
#     fi
#   done
# else
# polybar --reload main &
# fi
