source $ZDOTDIR/zshrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nix package manager
. $HOME/.nix-profile/etc/profile.d/nix.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# To load rbenv automatically
eval "$(rbenv init -)"
