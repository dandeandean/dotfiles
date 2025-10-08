export EDITOR="nvim"
export ZSH_THEME=${ZSH_THEME:-bira}
export CONFIG_PATH="$HOME/.config/"
export XDG_CONFIG_HOME="$HOME/.config/"

if command -v go &> /dev/null; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi
if command -v zk &> /dev/null; then
  export ZK_NOTEBOOK_DIR="$HOME/Notes/"
fi
if command -v cards &> /dev/null; then
  export CARDSHOME="$HOME/.config/cards"
fi

autoload -Uz compinit
compinit

if command -v bookworm &>/dev/null; then
  # It's been said you should do this with adding the completion to _fpath
  # That's too complicated
  source <(bookworm completion zsh)
fi

