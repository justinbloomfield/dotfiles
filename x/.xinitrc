#!/bin/sh
xrdb ~/.Xresources & 
xsetroot -cursor_name left_ptr &
urxvt &
#xset +fp /usr/share/fonts &
exec cwm