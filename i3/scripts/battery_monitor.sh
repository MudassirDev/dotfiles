#!/bin/bash

# Threshold
LOW_LEVEL=10
CRITICAL_LEVEL=5
WARNING_SENT=false
CRITICAL_SENT=false

while true; do
    # Get current battery level and state
    BAT_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    BAT_STATUS=$(acpi -b | grep -i 'discharging')

    if [[ "$BAT_STATUS" != "" ]]; then
        if (( BAT_LEVEL <= LOW_LEVEL )) && [ "$WARNING_SENT" = false ]; then
            # Dim the screen
            brightnessctl set 10%
            # Play warning sound (replace with your sound file if you want)
            paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga
            WARNING_SENT=true
        fi

        if (( BAT_LEVEL <= CRITICAL_LEVEL )) && [ "$CRITICAL_SENT" = false ]; then
            paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga
            CRITICAL_SENT=true
        fi
    else
        # On AC power, reset flags
        WARNING_SENT=false
        CRITICAL_SENT=false
    fi

    sleep 60
done
