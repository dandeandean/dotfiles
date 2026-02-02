## Just Source this in your .zshrc
source "${funcsourcetrace[1]%/*}/env.zsh"
source "${funcsourcetrace[1]%/*}/alias.zsh"
source "${funcsourcetrace[1]%/*}/func.zsh"
source "${HOME}/.secrets.zsh"

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# TMUX on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  if [[ ! "$XDG_SESSION_TYPE" =~ "tty" ]]; then
    exec tmux
  fi
fi
