EDITOR="emacsclient -c"
PAGER="less"
LANG="en_AU.UTF-8"
LC_CTYPE="en_AU.UTF-8"
NTFY_FIFO_PATH="/home/$(whoami)/var/ntfy/ntfy.fifo"
SRC_DIR="/home/$(whoami)/src/pkg"
CHOME="/home/$(whoami)/usr"
CHROOT="/home/poq/src/crx/chroot"
#PATH=/home/poq/bin/:/home/poq/.cabal/bin/:/usr/local/bin/:/usr/bin/:/sbin:/Users/j/bin:/opt/pkg/bin:/Library/TeX/texbin:/usr/sbin:/home/poq/src/go/bin:/home/poq/.local/bin:/opt/local/bin:/opt/local/sbin:/Users/j/.local/bin:/opt/texlive/2016/bin/x86_64-linux:/bin:/home/poq/.stack/programs/x86_64-linux/ghc-ncurses6-8.0.2/bin
#PATH=$PATH:/usr/local/bin:$HOME/src/nix/result/bin:$HOME/bin:$HOME/src/go/bin/:$HOME/.cabal/bin:$HOME/.local/bin:$HOME/bin:/opt/texlive/2017/bin/x86_64-linux/:/sbin:/Library/TeX/texbin
PATH=$PATH:$HOME/bin:/sbin:/usr/sbin
#WM="windowchef"
BROWSER="chromium"
MAIL="/home/poq/var/mail/jbl"
WP_DIR="/home/poq/usr/img/wp"
GOPATH="/home/poq/src/go"
#GTK_IM_MODULE=ibus
#XMODIFIERS=@im=ibus
#QT_IM_MODULE=ibus
SSH_ASKPASS=''
#PS1=$'\E[36;1m/\E[34;1m$(pwd | sed "s,^$HOME,~,")\E[36;1m/\E[0m '
PS1=$'\E[36;1m > \E[0m'
APULSE_PLAYBACK_DEVICE="plugdmix"
GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"
#(cat ~/.cache/wal/sequences &)
JAVA_HOME="/usr/lib/jvm/oracle-jdk"
export CSC EDITOR PAGER NTFY_FIFO_PATH LC_CTYPE PATH CHOME WM WP_DIR GOPATH TERM GTK_IM_MODULE XMODIFIERS QT_IM_MODULE MAIL PS1 SSH_ASKPASS JAVA_HOME LANG GUIX_LOCPATH
