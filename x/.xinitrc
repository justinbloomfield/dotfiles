#!/bin/sh

xrdb ~/.Xresources &
hsetroot -solid '#1c2023' &
xsetroot -cursor_name left_ptr &
setxkbmap us -variant dvp -option ctrl:nocaps &
sxhkd -c ~/.config/sxhkd/dwm_sxhkdrc -m -1 &
picom --config ~/.config/picom.conf &
xset s off &
xset s noblank &
xset s noexpose & 
xset c on &
xset -dpms &
urxvtd &
light -S 25 &
thunar --daemon &
#hhbsp &
devmon &
#xrandr --output eDP-1 --off &
#xrandr --output HDMI-1 --right-of eDP-1 &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
/usr/lib/mate-notification-daemon/mate-notification-daemon &
sb &
xbanish -t 2000 -s &
while true; do
	dwm 2> ~/.dwm.log
done
