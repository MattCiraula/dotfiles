source $HOME/.bashrc

# automatically start x when logging in to tty1
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep bspwm || startx
fi
