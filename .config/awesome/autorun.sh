#!/usr/bin/env bash
picom &
feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers/* &
~/.config/polybar/launch.sh &
xbindkeys -f ~/.config/xbindkeys/config &
light-locker &
dunst &
unclutter -root
