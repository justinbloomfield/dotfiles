#!/bin/sh
xrdb ~/.Xresources & 
xsetroot -cursor_name left_ptr &
hsetroot -full $HOME/usr/img/
exec cwm