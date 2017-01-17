# Disable access control
#xhost +SI:localuser:$USER

# Fallback cursor
#xsetroot -cursor_name left_ptr &

# Other stuff
#start-pulseaudio-x11 &
#sudo mpd &
#unclutter --timeout 1 &
#xrdb ~/.Xresources &
setxkbmap us -variant colemak &

# Start Emacs
#exec xmonad 
#sudo killall mpd
exec dwm
