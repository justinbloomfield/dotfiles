#!/bin/sh
xrdb ~/.Xresources & 
xsetroot -cursor_name left_ptr &
hsetroot -solid "#000000" &
ntfyd &
hsetroot -full ~/usr/img/supersweeter.png &
sxhkd -c ~/.config/sxhkd/sxhkdrc_wc & 
clockbar &
compton &
emacs &
unclutter --timeout 1 -b &
exec windowchef &


