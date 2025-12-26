# ============================================================================
# Zsh Configuration
# ============================================================================

# ----------------------------------------------------------------------------
# Oh My Zsh Configuration
# ----------------------------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"

# Set custom theme (ensure the theme is installed in ~/.oh-my-zsh/custom/themes)
ZSH_THEME="shimaenaga"

# Make completion case-insensitive and hyphen-insensitive
HYPHEN_INSENSITIVE="true"

# Configure Oh My Zsh update behavior
zstyle ':omz:update' mode reminder

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Show dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Load Oh My Zsh plugins
# Available plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(git)

# Initialize Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ----------------------------------------------------------------------------
# Custom Aliases and Functions
# ----------------------------------------------------------------------------

# Determine the dotfiles directory dynamically
# This resolves the actual location of .zshrc if it's a symlink
if [ -L "$HOME/.zshrc" ]; then
    DOTFILES_ZSH_DIR="$(dirname "$(readlink "$HOME/.zshrc")")"
else
    # Fallback to default location
    DOTFILES_ZSH_DIR="$HOME/dotfiles/zsh"
fi

# Source custom aliases if the file exists
if [ -f "$DOTFILES_ZSH_DIR/.zshrc_aliases" ]; then
    source "$DOTFILES_ZSH_DIR/.zshrc_aliases"
fi

# ----------------------------------------------------------------------------
# Optional: Python Environment (pyenv)
# ----------------------------------------------------------------------------
# Uncomment the following line to enable pyenv initialization
# eval "$(pyenv init -)"
