#!/bin/sh
xsetroot -cursor_name left_ptr &
#ntfyd &
hsetroot -solid "#000000" &
#sxhkd -c ~/.config/sxhkd/sxhkdrc_wc & 
#clockbar &
xrdb ~/.Xresources & 
#compton --config ~/.config/compton.conf &
#emacs &
#unclutter --timeout 1 -b &
#exec windowchef
xrandr --output DP-0 --mode 1920x1080 --rate 144 &
sbar &
start-pulseaudio-x11 &
exec herbstluftwm -c /home/poq/.config/herbstluftwm/autostart
