#!/bin/sh
#xrandr --output DP-0 --rotate left &
xrdb ~/.Xresources & 
xsetroot -cursor_name left_ptr &
hsetroot -solid "#000000" &
ntfyd &
sxhkd -c ~/.config/sxhkd/sxhkdrc_wc & 
clockbar &
ntfyd &
compton &
emacs &
unclutter --timeout 1 -b &
#funcbutton &
#musicbar &
exec windowchef &
hsetroot -full ~/usr/img/supersweeter.png &
xwait 


