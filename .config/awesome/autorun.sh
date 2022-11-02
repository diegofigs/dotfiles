#!/usr/bin/env bash
picom -b --no-vsync &
feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers/* &
~/.config/polybar/launch.sh &
unclutter -root
