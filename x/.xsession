#!/bin/sh

xrdb ~/.Xresources &
#ibus-daemon -drx &
#sbar 2>/dev/null &
#xsetroot -solid '#102530' &
#hsetroot -fill ~/usr/img/japflowerstreet.png &
#xrandr --output DVI-I-1 --rotate left --mode 1920x1080 --rate 120 &
#setxkbmap us -variant dvp -option ctrl:nocaps &
exec xterm
