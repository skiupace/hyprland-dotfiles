#!/bin/bash

grim -t png -g "$(slurp -o)" $HOME/Pictures/Screenshots/$(date +'%s_grim.png')
