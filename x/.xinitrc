#!/bin/sh
xrdb ~/.Xresources & 
xsetroot -cursor_name left_ptr &
hsetroot -solid "#254348" &
compton &
ntfyd &
exec cwm