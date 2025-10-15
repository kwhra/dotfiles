export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="shimaenaga"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

dotfiles_path="$HOME/dotfiles/zsh"

if [ -f "$dotfiles_path/.zshrc_aliases" ]; then
	. "$dotfiles_path/.zshrc_aliases"
fi

# pyenv
eval "$(pyenv init -)"
