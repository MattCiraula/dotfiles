# exit if not running interactively
case $- in
    *i*) ;; # interactive
    *) return ;; 
esac

set -o vi
shopt -s histappend
shopt -s dotglob
shopt -s extglob
export HISTFILESIZE=10000
export XDG_CONFIG_HOME="$HOME/.config"

source $XDG_CONFIG_HOME/shell/aliasrc
source $XDG_CONFIG_HOME/shell/functions
source $XDG_CONFIG_HOME/shell/env

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
[ -x "$(command -v tmux)" ] \
    && [ -z "$TMUX" ] \
    && { tmux attach || tmux; } >/dev/null 2>&1
