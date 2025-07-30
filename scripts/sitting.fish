#!/usr/bin/env fish
while true
    echo "started"

    sleep 5m
    notify-send -u critical "posture + blink"

    sleep 5m
    notify-send -u critical "posture + blink"

    sleep 5m
    notify-send -u critical "posture + blink"

    sleep 5m
    notify-send -u critical "20-20-20"
    notify-send -u critical "posture + blink"
end
