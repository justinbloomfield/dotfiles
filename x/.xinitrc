# Disable access control
#xhost +SI:localuser:$USER

# Fallback cursor
xsetroot -cursor_name left_ptr &

# Other stuff
setxkbmap us -variant colemak &
#start-pulseaudio-x11 &
#xmodmap ~/.Xmodmap &
xrdb ~/.Xresources &
xrandr --output HDMI-1 --left-of LVDS-1 &

# Start Emacs
exec dwm 
