# Disable access control
#xhost +SI:localuser:$USER

# Fallback cursor
xsetroot -cursor_name left_ptr &

# Other stuff
setxkbmap us -variant colemak &
xmodmap ~/.Xmodmap &
xrdb ~/.Xresources &

# Start Emacs
emacs &
exec cwm
