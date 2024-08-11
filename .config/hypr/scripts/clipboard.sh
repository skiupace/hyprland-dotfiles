#!/usr/bin/env bash

# ICON_BELL="$HOME/.local/share/icons/custom/gruvbox-pack/bell-notification.png"
ROFI_THEME="$HOME/.config/rofi/config.rasi"

case "$1" in
	show)
		cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy
		;;
	clean)
		cliphist wipe
		notify-send -r 72 "Clipboard cleared"
		;;
esac

