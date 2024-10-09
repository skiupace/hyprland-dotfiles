#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

# Path to the Hyprland configuration file
#HYPRLAND_CONF="$HOME/.config/hypr/hyprland.conf"

# Generate a list of wallpapers
wallpapers=$(find "$WALLPAPER_DIR" -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.webp' \) -print)

# Extract just the filenames
filenames=$(echo "$wallpapers" | xargs -n 1 basename)

# Use rofi to select a wallpaper by filename
selected_filename=$(echo "$filenames" | rofi -dmenu -i -p "Select Wallpaper:")

# Check if a wallpaper was selected
if [ -n "$selected_filename" ]; then
    # Set the path using $WALLPAPER_DIR
    wallpaper_path="\$HOME/Pictures/Wallpapers/$selected_filename"
    
    # Update the $wallpaper variable in the hyprland.conf file
    #sed -i "s|^\(\s*\$wallpaper\s*=\s*\).*|\1$wallpaper_path|" "$HYPRLAND_CONF"
    swww img $wallpaper_path
    echo "Wallpaper has been updated"
else
    echo "No wallpaper selected."
fi

