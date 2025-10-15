# ~.zprofile

# path
dotfiles_path="$HOME/dotfiles/zsh"

if [ -f "$dotfiles_path/.zprofile_path" ]; then
	. "$dotfiles_path/.zprofile_path"
fi

# .zshrc
if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi
