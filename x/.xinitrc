#!/bin/sh
xrdb ~/.Xresources & 
xsetroot -cursor_name left_ptr &
hsetroot -solid "#000000" &
ntfyd &
sxhkd -c ~/.config/sxhkd/sxhkdrc_wc & 
xrandr --output DisplayPort-0 --mode 1920x1080 --rate 119.98 &
clockbar &
ntfyd &
compton &
emacs -daemon &
#funcbutton &
#musicbar &
exec windowchef

