#!/bin/bash

# Get current volume (percentage) of default sink
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Decrease volume by 5% only if greater than 0%
if [ "$vol" -gt 0 ]; then
  pactl set-sink-volume @DEFAULT_SINK@ -5%
else
  pactl set-sink-volume @DEFAULT_SINK@ 0%
fi
