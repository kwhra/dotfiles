#!/bin/bash

# スクリプトがエラーで停止した場合、そこで処理を中断する
set -e

echo "🚀 Starting dotfiles setup..."

# --- 変数定義 ---
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)


# --- .zprofile と .zshrc のシンボリックリンクを作成 ---
echo "🔗 Symlinking Zsh configuration files..."
ln -snf "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
ln -snf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
echo "✅ .zprofile and .zshrc linked."


# --- Zshカスタムテーマのシンボリックリンクを作成 ---
echo "🎨 Symlinking Zsh themes..."
ZSH_THEME_SRC_DIR="$DOTFILES_DIR/zsh_theme"
ZSH_THEME_DEST_DIR="$HOME/.oh-my-zsh/custom/themes"

# Oh My Zshのカスタムテーマディレクトリが存在するかチェック
if [ -d "$ZSH_THEME_DEST_DIR" ]; then
  # 存在するなら、zsh_themeディレクトリ内のすべてのファイルをリンク
  for theme_file in "$ZSH_THEME_SRC_DIR"/*; do
    # ファイル名だけを抽出
    base_name=$(basename "$theme_file")
    ln -snf "$theme_file" "$ZSH_THEME_DEST_DIR/$base_name"
  done
  echo "✅ Zsh themes symlinked."
else
  # 存在しないなら、警告メッセージを表示してスキップ
  echo "⚠️  Warning: Directory not found: $ZSH_THEME_DEST_DIR"
  echo "   Skipping Zsh theme symlinking. Please install Oh My Zsh first."
fi


# --- .gitconfig のシンボリックリンクを作成 ---
echo "🔗 Symlinking Git configuration..."
ln -snf "$DOTFILES_DIR/gitconfig/.gitconfig" "$HOME/.gitconfig"
echo "✅ .gitconfig linked."


echo "🎉 Dotfiles setup complete!"
