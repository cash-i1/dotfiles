#!/bin/bash

# Define the directory for screenshots
screenshot_dir=~/screenshots/$(date +'%Y-%m')

# Create the directory if it doesn't exist
mkdir -p "$screenshot_dir"

# Generate random characters for the filename
random_chars=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8)

# Get the window name
window_name=$(xdotool getwindowfocus getwindowname)

# Replace spaces in the window name with underscores
# window_name="${window_name// /_}"
window_name=${window_name%%.*}

# Extract only the filename from the path
window_name=$(basename "$window_name")

# Remove file extension if present
window_name=${window_name%%.*}
# Construct the full path for the screenshot
# screenshot_path="$screenshot_dir/$random_chars""_$window_name.png"

screenshot_path="$screenshot_dir/${random_chars}_${window_name}.png"

# Check if the file already exists, regenerate random name if needed
while [ -e "$screenshot_path" ]; do
    random_chars=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8)
    screenshot_path="$screenshot_dir/${random_chars}_${window_name}.png"
done

# Take the screenshot using maim
# maim "$screenshot_path" --select | xclip -selection clipboard -t image/png
maim "$screenshot_path" --select
xclip -selection clipboard -t image/png -i "$screenshot_path"

echo "Screenshot saved to: $screenshot_path"
