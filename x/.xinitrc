#!/bin/sh

xrdb ~/.Xresources &
hsetroot -solid '#1c2023' &
xsetroot -cursor_name left_ptr &
setxkbmap us -variant dvp -option ctrl:nocaps &
#sxhkd -c ~/.config/sxhkd/dwm_sxhkdrc -m -1 &
picom --config ~/.config/picom.conf &
xset s off &
xset s noblank &
xset s noexpose & 
xset c on &
xset -dpms &
#light -S 25 &
#thunar --daemon &
#hhbsp &
#devmon &
#xrandr --output eDP-1 --off &
#xrandr --output HDMI-1 --right-of eDP-1 &
#/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
#/usr/lib/mate-notification-daemon/mate-notification-daemon &
# sb &
xbanish -t 2000 -s &
#xrandr --output DVI-I-1 --off &
#xrandr --output DP-4 --left-of DVI-I-1 &
#xrandr --output DVI-I-1 --mode 1920x1080 --rate 144 &
exec xmonad
