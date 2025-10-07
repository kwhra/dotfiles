# kwhra's dotfiles

## 概要
- .zprofile, .zshrc
- *.zsh-theme
- .gitconfig

## 使い方
1. zsh, oh-my-zsh をセットアップする
```
# bash
sudo apt install zsh
chsh -s $(which zsh)
# revoke shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
2. クローンする
```
git clone https://github.com/kwhra/dotfiles.git
```
3. `install.sh` を起動
```
chmod +x install.sh
./install.sh
```
