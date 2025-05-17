#!/usr/bin/env fish

set -l wallpaper_dir "/media/chdd2/images/wallpapers"
set -l wallpaper (random choice $wallpaper_dir/**)

if test (count $argv) = 1
    # open nsxiv picker
    if test $argv[1] = "choose"
        set -l output (nsxiv -bot $wallpaper_dir)

        # if nsxiv output exists set the wallpaper 
        # else exit (no point reloading wal)
        if test -e "$output"
            set wallpaper $output
        else
            exit
        end
    # set wallpaper to arg 1 if it exists
    else if test -e "$argv[1]"
        set wallpaper $argv[1]
    end
end

wal -i $wallpaper
