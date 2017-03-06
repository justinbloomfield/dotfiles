# Fallback cursor
xsetroot -cursor_name left_ptr &
#unclutter --timeout 1 &
xrdb ~/.Xresources &
setxkbmap jp colemak &
#export GTK_IM_MODULE=uim
#export QT_IM_MODULE=uim
#export XMODIFIERS=@im=uim
#uim-xim &
xset s off &
xset -dpms &
xsetroot -solid $(xrq color5) &
xmobar ~/.xmonad/xmobar.conf &
ntfyd &
exec xmonad  
killall ntfyd
