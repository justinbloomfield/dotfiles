#!/bin/sh
xrdb ~/.Xresources & 
xsetroot -cursor_name left_ptr &
hsetroot -solid "#151515" &
ntfyd &
sxhkd -c ~/.config/sxhkd/sxhkdrc_pulse & 
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144 &
start-pulseaudio-x11 &
exec xmonad
