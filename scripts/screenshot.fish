#!/usr/bin/env fish

set -l out_dir "/tmp/screenshots"
set -l out_file "$out_dir/$(date "+%s").png"

# quit if $out_file is 0 length
# impossible case but it doesn't hurt
if test -z $out_file
    exit 1
end

# kind of a hack
# if out_file already exists just save the screenshot
# into /tmp
if test -e "$out_file"
    notify-send "$out_file alredy exists. will save to /tmp/temp-screenshot.png"
    set out_file "/tmp/temp-screenshot.png"
end

# ensure that out_file's directory exists
mkdir -p (dirname $out_file)

# take screenshot
shotgun -g (slop) - > "$out_file" 

# copy to clipboard
xclip -selection clipboard -t image/png "$out_file"
