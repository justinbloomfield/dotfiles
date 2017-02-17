 Fallback cursor
xsetroot -cursor_name left_ptr &
unclutter --timeout 1 &
xrdb ~/.Xresources &
setxkbmap jp colemak &
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
ibus-daemon -drx &
sxhkd -c ~/.config/sxhkd/sxhkdrc_wc -m -1 &
xsetroot -solid $(xrq color8) &
start-pulseaudio-x11 &
#xrandr --output DP-2 --mode 1920x1080 --rate 144 &
mpd &
exec ctwm  
