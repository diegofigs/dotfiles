#!/usr/bin/env bash
picom &
feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers/* &
~/.config/polybar/launch.sh &
xbindkeys -f ~/.config/xbindkeys/config &
dunst &
unclutter -root
