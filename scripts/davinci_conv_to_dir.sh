#!/bin/bash

dir="$2"

echo "$1 -> $2${1%.*}.mov"

ffmpeg -i "$1" -c:v dnxhd -profile:v dnxhr_hq -vf "format=yuv422p" -c:a pcm_s16le -map 0:v -map 0:a -threads 16 "$2/${1%.*}.mov"
