source $ZDOTDIR/zshrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
# [ -s "/home/radar/.bun/_bun" ] && source "/home/radar/.bun/_bun"

# asdf completions
. "$HOME/.asdf/asdf.sh"

# [ -f "/home/radar/.ghcup/env" ] && source "/home/radar/.ghcup/env" # ghcup-env

# opam configuration
# bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"

# starship prompt
eval "$(starship init zsh)"

# zoxide directory jumping
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/home/radar/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


GPG_TTY=$(tty)
export GPG_TTY
