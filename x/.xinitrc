#!/bin/sh
#xsetroot -cursor_name left_ptr &
#ntfyd &
#hsetroot -solid "#787878" &
#sxhkd -c ~/.config/sxhkd/sxhkdrc_wc & 
#clockbar &
xrdb ~/.Xresources & 
#compton --config ~/.config/compton.conf &
#emacs &
#unclutter --timeout 1 -b &
#exec windowchef
exec herbstluftwm -c /home/poq/.config/herbstluftwm/autostart
