source $ZDOTDIR/zshrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To load rbenv automatically
eval "$(rbenv init -)"

# Loading NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
