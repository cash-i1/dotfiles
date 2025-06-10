#!/usr/bin/env fish

if test (count $argv) != 1; 
    echo "arg 1 must be either 'pic' or 'vid' or 'stop-vid'"
    exit 1
end
switch $argv[1]
    case pic vid stop-vid
        echo "valid"
    case "*"
        echo "arg 1 must be either 'pic' or 'vid' or 'stop-vid'"
        exit 1
end

set -l mode $argv[1]
set -l out_dir "/tmp/screenshots"
set -l out_ext "png"
set -l out_file "$out_dir/$(date "+%s").$out_ext"

# quit if $out_file is 0 length
# impossible case but it doesn't hurt
if test -z $out_file
    exit 1
end

echo "==> mode: $mode"

if test $mode = "pic"
    set out_ext "png"
else if test $mode = "vid"
    set out_ext "mp4"
end

# kind of a hack
# if out_file already exists just save the screenshot
# into /tmp
if test -e "$out_file"
    notify-send "$out_file alredy exists. will save to /tmp/temp-screenshot.$out_ext"
    set out_file "/tmp/temp-screenshot.$out_ext"
end

# ensure that out_file's directory exists
mkdir -p (dirname $out_file)

# take screenshot
if test $mode = "pic"
    shotgun -g (slop -q) - > "$out_file" 
    xclip -selection clipboard -t image/png "$out_file"
else if test $mode = "vid"
    if test -e /tmp/vid.lock
        echo "video is already going"
        exit 1
    end
    set -l slop_output (slop -q -f "%wx%h|%x,%y")
    set -l vid_size (string split "|" $slop_output)[1]
    set -l vid_pos (string split "|" $slop_output)[2]
    set -l display $DISPLAY
    echo $vid_size $vid_pos
    echo ffmpeg -video_size $vid_size -framerate 30 -f x11grab -i $DISPLAY+$vid_pos "$out_file" &
    echo "$last_pid|$out_file" > /tmp/vid.lock
else if test $mode = "stop-vid"
    if not test -e /tmp/vid.lock
        exit 1
    end
    set -l pid (string split "|" (cat /tmp/vid.lock))[1]
    set -l file (string split "|" (cat /tmp/vid.lock))[2]
    echo "$pid , $file"
    kill $pid 
    xclip -selection clipboard -t image/mp4 "$out_file"
    rm /tmp/vid.lock
end
