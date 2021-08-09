# Lines configured by zsh-newuser-install
HISTFILE=/home/matt/.config/zsh/histfile
HISTSIZE=10000
SAVEHIST=50000
unsetopt beep
bindkey -v
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# from work config
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

cd-back-widget() {
  cd ..
}
zle      -N   cd-back-widget
bindkey  '^U' cd-back-widget

# TODO: Fix this
cd-last-widget() {
  cd -
}
zle -N cd-last-widget
bindkey '^B' cd-last-widget

source $ZDOTDIR/aliasrc
source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/prompt.zsh
