export EDITOR="nvim"
export ZSH_THEME=bira
export CONFIG_PATH=bira

if command -v go &> /dev/null; then
	export PATH="$PATH:$(go env GOPATH)/bin"
fi

if command -v zk &> /dev/null; then
	export ZK_NOTEBOOK_DIR="$HOME/Notes/"
fi
if command -v cards &> /dev/null; then
	export CARDSHOME="$HOME/.config/cards"
fi
