## Just Source this in your .zshrc
source ./env.zsh
source ./alias.zsh
source ./func.zsh

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi
# TMUX on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Completion
autoload -Uz compinit
