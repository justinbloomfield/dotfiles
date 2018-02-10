export HOME=/home/poq
source $HOME/etc/info
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


if [ -e /home/poq/.nix-profile/etc/profile.d/nix.sh ]; then . /home/poq/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
