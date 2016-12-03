#!/bin/sh
xsetroot -cursor_name left_ptr &
hsetroot -solid "#000000" &
xrdb ~/.Xresources & 
xrandr --output DP-2 --mode 1920x1080 --rate 144 &
sbar &
start-pulseaudio-x11 &
sudo mpd &
setxkbmap us -variant colemak &
exec herbstluftwm -c /home/poq/.config/herbstluftwm/autostart
