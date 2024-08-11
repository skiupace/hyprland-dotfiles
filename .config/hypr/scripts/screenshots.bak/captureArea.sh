#!/bin/bash

grim -t png -g "$(slurp)" $HOME/Pictures/Screenshots/$(date +'%s_grim.png')
