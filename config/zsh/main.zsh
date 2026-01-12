## Just Source this in your .zshrc
source "${funcsourcetrace[1]%/*}/env.zsh"
source "${funcsourcetrace[1]%/*}/alias.zsh"
source "${funcsourcetrace[1]%/*}/func.zsh"
source "${funcsourcetrace[1]%/*}/secrets.zsh"

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# TMUX on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  if [[ ! "$TERM"  =~ "linux" ]]; then
    exec tmux
  fi
fi
