#!/bin/sh
xsetroot -cursor_name left_ptr &
ntfyd &
hsetroot -solid "#787878" &
setxkbmap us -variant colemak &
sxhkd -c ~/.config/sxhkd/sxhkdrc_wc_lap & 
clockbar &
xrdb ~/.Xresources & 
compton --config ~/.config/compton.conf &
emacs &
#unclutter --timeout 1 -b &
exec windowchef
