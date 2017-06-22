#!/bin/sh

xrdb ~/.Xresources &
export GTK_IM_MODULE=ibus &
export XMODIFIERS=@im=ibus &
export QT_IM_MODULE=ibus &
ibus-daemon -drx &
sbar 2>/dev/null &
#xsetroot -solid '#102530' &
hsetroot -fill ~/usr/img/japflowerstreet.png &
xrandr --output DVI-I-1 --rotate left --mode 1920x1080 --rate 120 &
exec cwm
