# make plugins dir if it does not exist
if [ ! -d $ZDOTDIR/plugins ]; then
    mkdir $ZDOTDIR/plugins
fi

# pull plugins from github if they do not exist
# autosuggestions
if [ ! -d $ZDOTDIR/plugins/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZDOTDIR/plugins/zsh-autosuggestions
fi

# fast syntax highlighting
if [ ! -d $ZDOTDIR/plugins/fast-syntax-highlighting ]; then
  git clone https://github.com/zdharma/fast-syntax-highlighting $ZDOTDIR/plugins/fast-syntax-highlighting
fi

source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/fzf-key-bindings.zsh
