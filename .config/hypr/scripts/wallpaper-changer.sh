#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

# Generate a list of wallpapers
wallpapers=$(find "$WALLPAPER_DIR" -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.webp' \) -print)

# Extract just the filenames
filenames=$(echo "$wallpapers" | xargs -n 1 basename)

# Use rofi to select a wallpaper by filename
selected_filename=$(echo "$filenames" | rofi -dmenu -i -p "Select Wallpaper:")

# Check if a wallpaper was selected
if [ -n "$selected_filename" ]; then
    # Set the path using $WALLPAPER_DIR
    wallpaper_path="$HOME/Pictures/Wallpapers/$selected_filename"
    swww img $wallpaper_path
else
    echo "No wallpaper selected."
fi

