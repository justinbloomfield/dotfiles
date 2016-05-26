#!/bin/sh
urxvtd &
sxhkd &
hsetroot -tile ~/usr/pic/test_tile11.png &
xrdb ~/.Xresources & 
compton --config ~/.config/compton.conf &
barclock &
echo a | sudo -S mpd &
xsetroot -cursor_name left_ptr&
#wew | wewhandle &
unclutter --timeout 1 &
xrandr --output DP-1 --mode 1920x1080 --rate 144 &
ntfyd &
exec cwm
#xwait
#exec cde
#exec runfyre.sh
