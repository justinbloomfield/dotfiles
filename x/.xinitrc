# Disable access control
#xhost +SI:localuser:$USER
# Fallback cursor
xsetroot -cursor_name left_ptr &
# Other stuff
start-pulseaudio-x11 &
sudo mpd &
unclutter --timeout 1 &
xrdb ~/.Xresources &
setxkbmap jp colemak &
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'
sxhkd -c ~/.config/sxhkd/sxhkdrc_wc -m -1 &
xsetroot -solid $(xrq color8) &
exec windowchef  
sudo killall mpd
