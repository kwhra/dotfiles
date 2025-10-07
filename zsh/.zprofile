# ~.zprofile

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# path
if [ -f ~/.zprofile_path ]; then
  . ~/.zprofile_path
fi

# .zshrc
if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi
