# ~.zprofile

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# path
dotfiles_path="$HOME/dotfiles/zsh"

if [ -f "$dotfiles_path/.zprofile_path" ]; then
	. "$dotfiles_path/.zprofile_path"
fi

# .zshrc
if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi
