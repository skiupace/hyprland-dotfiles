#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

# Generate a list of wallpapers
wallpapers=$(find "$WALLPAPER_DIR" -type f \( -name '*.jpg' -o -name '*.png' \) -print)

# Extract just the filenames
filenames=$(echo "$wallpapers" | xargs -n 1 basename)

# Use rofi to select a wallpaper by filename
selected_filename=$(echo "$filenames" | rofi -dmenu -i -p "Select Wallpaper:")

# Find the full path corresponding to the selected filename
selected_wallpaper=$(echo "$wallpapers" | grep "$(basename "$selected_filename")")

# Check if a wallpaper was selected
if [ -n "$selected_wallpaper" ]; then
    # Set the wallpaper using swaybg
    swaybg -i "$selected_wallpaper" -m fill
else
    echo "No wallpaper selected."
fi

