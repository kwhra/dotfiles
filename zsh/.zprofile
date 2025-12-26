# ============================================================================
# Zsh Profile Configuration
# ============================================================================
# This file is sourced by Zsh on login shells

# ----------------------------------------------------------------------------
# PATH Configuration
# ----------------------------------------------------------------------------

# Determine the dotfiles directory dynamically
# This resolves the actual location of .zprofile if it's a symlink
if [ -L "$HOME/.zprofile" ]; then
    DOTFILES_ZSH_DIR="$(dirname "$(readlink "$HOME/.zprofile")")"
else
    # Fallback to default location
    DOTFILES_ZSH_DIR="$HOME/dotfiles/zsh"
fi

# Source PATH configuration
if [ -f "$DOTFILES_ZSH_DIR/.zprofile_path" ]; then
    source "$DOTFILES_ZSH_DIR/.zprofile_path"
fi

# ----------------------------------------------------------------------------
# Initialize Interactive Shell
# ----------------------------------------------------------------------------

# Source .zshrc for interactive shells
if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi
