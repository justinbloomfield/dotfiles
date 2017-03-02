# Fallback cursor
xsetroot -cursor_name left_ptr &
#unclutter --timeout 1 &
xrdb ~/.Xresources &
setxkbmap jp colemak &
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS=@im=uim
uim-xim &
#dwmclock &
#sxhkd -c ~/.config/sxhkd/sxhkdrc_wc -m -1 &
xsetroot -solid $(xrq color8) &
ntfyd &
#xrandr --output DP-2 --mode 1920x1080 --rate 144 &
st &
exec xmonad  
killall ntfyd
#killall dwmclock
