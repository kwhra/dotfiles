#!/bin/bash
#
# Dotfiles Installation Script
# This script creates symbolic links from the dotfiles directory to the home directory
# Exit immediately if a command exits with a non-zero status

set -e

# ============================================================================
# Configuration
# ============================================================================

DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# ============================================================================
# Helper Functions
# ============================================================================

# Print colored output messages
print_info() {
    echo "ℹ️  $1"
}

print_success() {
    echo "✅ $1"
}

print_warning() {
    echo "⚠️  $1"
}

print_error() {
    echo "❌ $1" >&2
}

# Validate that required directories exist
validate_environment() {
    print_info "Validating environment..."
    
    if [ ! -d "$DOTFILES_DIR/zsh" ]; then
        print_error "Required directory not found: $DOTFILES_DIR/zsh"
        exit 1
    fi
    
    if [ ! -d "$DOTFILES_DIR/gitconfig" ]; then
        print_error "Required directory not found: $DOTFILES_DIR/gitconfig"
        exit 1
    fi
    
    print_success "Environment validation passed"
}

# Create a backup of an existing file or symlink
backup_if_exists() {
    local target=$1
    
    if [ -e "$target" ] || [ -L "$target" ]; then
        mkdir -p "$BACKUP_DIR"
        local backup_path="$BACKUP_DIR/$(basename "$target")"
        print_warning "Backing up existing file: $target -> $backup_path"
        mv "$target" "$backup_path"
    fi
}

# Create a symbolic link with backup
safe_symlink() {
    local source=$1
    local target=$2
    local description=$3
    
    if [ ! -e "$source" ]; then
        print_error "Source file does not exist: $source"
        return 1
    fi
    
    # Check if target already points to the correct source
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        print_info "$description already correctly linked, skipping"
        return 0
    fi
    
    # Backup existing file if it exists
    backup_if_exists "$target"
    
    # Create symlink
    ln -snf "$source" "$target"
    print_success "Linked: $description"
}

# ============================================================================
# Installation Functions
# ============================================================================

# Install Zsh configuration files
install_zsh_configs() {
    print_info "Installing Zsh configuration files..."
    
    safe_symlink "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile" ".zprofile"
    safe_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc" ".zshrc"
    
    print_success "Zsh configuration files installed"
}

# Install Zsh custom themes
install_zsh_themes() {
    print_info "Installing Zsh custom themes..."
    
    local theme_src_dir="$DOTFILES_DIR/zsh_theme"
    local theme_dest_dir="$HOME/.oh-my-zsh/custom/themes"
    
    # Check if Oh My Zsh is installed
    if [ ! -d "$theme_dest_dir" ]; then
        print_warning "Oh My Zsh custom themes directory not found: $theme_dest_dir"
        print_warning "Please install Oh My Zsh first, then run this script again"
        print_warning "Installation: sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
        return 0
    fi
    
    # Create destination directory if it doesn't exist
    mkdir -p "$theme_dest_dir"
    
    # Link all theme files
    local theme_count=0
    for theme_file in "$theme_src_dir"/*.zsh-theme; do
        if [ -f "$theme_file" ]; then
            local theme_name=$(basename "$theme_file")
            safe_symlink "$theme_file" "$theme_dest_dir/$theme_name" "theme: $theme_name"
            ((theme_count++))
        fi
    done
    
    if [ $theme_count -eq 0 ]; then
        print_warning "No theme files found in $theme_src_dir"
    else
        print_success "Installed $theme_count Zsh theme(s)"
    fi
}

# Install Git configuration
install_git_config() {
    print_info "Installing Git configuration..."
    
    safe_symlink "$DOTFILES_DIR/gitconfig/.gitconfig" "$HOME/.gitconfig" ".gitconfig"
    
    print_success "Git configuration installed"
}

# ============================================================================
# Main Installation Process
# ============================================================================

main() {
    echo ""
    echo "🚀 Starting dotfiles installation..."
    echo "   Dotfiles directory: $DOTFILES_DIR"
    echo ""
    
    # Validate environment
    validate_environment
    echo ""
    
    # Install configurations
    install_zsh_configs
    echo ""
    
    install_zsh_themes
    echo ""
    
    install_git_config
    echo ""
    
    # Show backup information if any backups were made
    if [ -d "$BACKUP_DIR" ]; then
        print_info "Backups saved to: $BACKUP_DIR"
        echo ""
    fi
    
    echo "🎉 Dotfiles installation complete!"
    echo ""
    echo "Next steps:"
    echo "  1. Restart your shell or run: source ~/.zshrc"
    echo "  2. Verify your configuration"
    echo ""
}

# Run main function
main
