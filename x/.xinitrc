# Disable access control
xhost +SI:localuser:$USER

# Fallback cursor
xsetroot -cursor_name left_ptr &

# Other stuff
setxkbmap us -variant colemak &
xrdb ~/.Xresources &
start-pulseaudio-x11 &
sudo mpd &

# Start Emacs
exec emacs
