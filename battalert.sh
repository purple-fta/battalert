#!/bin/sh


# SETTINGS
BAT="BAT0"           # Battery name (ls /sys/class/power_supply/)
LOW=20               # Low battery threshold (%)
CRIT=10              # Critical battery threshold (%)
CHECK_INTERVAL=120   # Check interval (seconds)
POWEROFF_DELAY=30    # Delay before shutdown (seconds)
# TEXT
LOW_TEXT="Заряд батареи"
CRIT_TEXT="Критически низкий заряд! Выключение через $POWEROFF_DELAY сек..."


NOTIFIED=0
while true; do
    LEVEL=$(cat /sys/class/power_supply/$BAT/capacity)
    STATUS=$(cat /sys/class/power_supply/$BAT/status)
    if [ "$STATUS" != "Charging" ]; then
        if [ "$LEVEL" -lt "$CRIT" ]; then
            notify-send --urgency=critical "$CRIT_TEXT"
            sleep "$POWEROFF_DELAY"
            systemctl poweroff
            exit
        elif [ "$LEVEL" -lt "$LOW" ] && [ "$NOTIFIED" -eq 0 ]; then
            notify-send "$LOW_TEXT"
            NOTIFIED=1
        elif [ "$LEVEL" -ge "$LOW" ]; then
            NOTIFIED=0
        fi
    fi
    sleep "$CHECK_INTERVAL"
done
