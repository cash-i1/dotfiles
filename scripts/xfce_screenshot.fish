#!/bin/fish
set screenshot_root_dir "/media/chdd2/screenshots/"
set screenshot_date_dir $(date +"%Y-%m")"/"
set date $(date +"%Y-%m-%d_%H-%M-%S")
set path $screenshot_root_dir"/"$screenshot_date_dir"/"$date".png"

echo $(dirname $path)
mkdir -p $(dirname $path)
maim -s $path
