#!/bin/bash
ICON_SCREENSHOT="$HOME/.local/share/icons/custom/gruvbox-pack/screenshot.png"

grim -t png $HOME/Pictures/Screenshots/$(date +'%s_grim.png') | wl-copy --type image/png
notify-send "Screenshot copied to clipboard"
