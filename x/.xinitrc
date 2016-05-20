#!/bin/bash
urxvtd &
sxhkd -c ~/.config/sxhkd/sxhkdrc_wmutils &
hsetroot -fill ~/usr/pic/startic.jpg &
xrdb ~/.Xresources & 
compton --config ~/.config/compton.conf &
touch ~/etc/notfocus &
barclock &
echo a | sudo -S mpd &
xsetroot -cursor_name left_ptr&
wew | wewhandle &
unclutter --timeout 1 &
xrandr --output DP-1 --mode 1920x1080 --rate 144 &
ntfyd &
xwait
#exec cde
#exec runfyre.sh
#exec dwm
#exec openbox-session
