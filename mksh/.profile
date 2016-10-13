source $HOME/etc/info
if [ -z "$TMUX" ]; then
	echo "Starting emacs daemon..."
	emacs --daemon > /dev/null 2>&1
fi
