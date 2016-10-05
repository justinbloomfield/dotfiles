#!/bin/sh
xrdb ~/.Xresources & 
xsetroot -cursor_name left_ptr &
hsetroot -solid "#5f9d81" &
ntfyd &
sxhkd -c ~/.config/sxhkd/sxhkdrc_pulse & 
xrandr --output DP-2 --mode 1920x1080 --rate 144 $
barclock &
xrandr --output DP-2 --mode 1920x1080 --rate 144 &
start-pulseaudio-x11 &
exec wmaker
