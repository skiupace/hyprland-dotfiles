#!/bin/bash

grim -g "$(slurp)" $HOME/Pictures/Screenshots/$(date +'%s_grim.png') && notify-send "a Screenshot was taken"
