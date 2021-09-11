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
source $XDG_CONFIG_HOME/shell/fzf/completion.bash
source $XDG_CONFIG_HOME/shell/fzf/key-bindings.bash

PS1="\[\033[1;33m\]\u\[\033[1;32m\]@\[\033[1;34m\]\h \[\033[1;36m\]\w \[\033[0;00m\]\$ "

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
[ -x "$(command -v tmux)" ] \
    && [ -z "$TMUX" ] \
    && { tmux attach || tmux; } >/dev/null 2>&1
