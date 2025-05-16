#!/usr/bin/env fish

# query monitor brightness if /tmp/current_brightness doesn't exist
if not test -f "/tmp/current_brightness"
    echo "$( \
        ddcutil get vcp 10 \
        | awk -F'current value = |,' '{print $2}' \
        | tr -d ' '
    )" > "/tmp/current_brightness"
end

# if there is no args, echo the brightness and quit
if test -z $argv[1]
    echo "bri $current%"
    exit 0
end

# get the current brightness level
set current (cat /tmp/current_brightness)

# inc. or decr. the brightness
if test (string lower $argv[1]) = "up"
    set current $(math $current + 10)
else if test (string lower $argv[1]) = "down"
    set current $(math $current - 10)
end

# clamp current between 0 and 100
if test "$current" -gt 100
    set current 100
else if test "$current" -lt 0
    set current 0
end

# save the current brightness
echo $current > /tmp/current_brightness

# set the monitor brightness to $current
ddcutil --sleep-multiplier=0 setvcp 10 "$current" &
