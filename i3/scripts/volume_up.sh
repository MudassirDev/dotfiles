#!/bin/bash

# Get current volume (percentage) of default sink
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Increase volume by 5% only if less than 100%
if [ "$vol" -lt 100 ]; then
  pactl set-sink-volume @DEFAULT_SINK@ +5%
else
  pactl set-sink-volume @DEFAULT_SINK@ 100%
fi
