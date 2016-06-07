#!/bin/sh
source $HOME/.mkshrc
source $HOME/etc/info
#source /home/j/.mksh_profile
export NTFY_FIFO_PATH=/tmp/ntfy.fifo
export NTFY_FIFO_CNT=/tmp/ntfy.cnt
export DVTM_FIFO=/tmp/dvtm-status.fifo
amixer sset Master 39%
mpd
#neighbourhoodwatch & 
export PS1="// "
export BROWSER="firefox"
export EDITOR="vim"
export CHOME=/home/j/usr
test -f $HOME/bin/panelsrc && . $HOME/bin/panelsrc
clear
