# kwhra's dotfiles

A comprehensive dotfiles repository for managing Zsh, Git, and shell configurations with a focus on maintainability and ease of use.

## 📋 Contents

This repository includes configuration files for:

- **Zsh Configuration**: `.zprofile`, `.zshrc`, and custom aliases
- **Zsh Custom Theme**: Shimaenaga theme for Oh My Zsh
- **Git Configuration**: `.gitconfig` with useful aliases and settings
- **Installation Script**: Automated setup with backup functionality

## 📁 Repository Structure

```
dotfiles/
├── install.sh              # Automated installation script
├── README.md              # This file
├── gitconfig/
│   └── .gitconfig         # Git configuration file
├── zsh/
│   ├── .zprofile          # Zsh profile (login shell)
│   ├── .zprofile_path     # PATH configuration
│   ├── .zshrc             # Zsh configuration (interactive shell)
│   └── .zshrc_aliases     # Custom aliases and functions
└── zsh_theme/
    └── shimaenaga.zsh-theme  # Custom Oh My Zsh theme
```

## 🚀 Installation

### Prerequisites

1. **Install Zsh** (if not already installed)
   ```bash
   # Ubuntu/Debian
   sudo apt install zsh
   
   # macOS (usually pre-installed)
   brew install zsh
   ```

2. **Set Zsh as your default shell**
   ```bash
   chsh -s $(which zsh)
   ```
   Log out and log back in for the change to take effect.

3. **Install Oh My Zsh**
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

### Setup Steps

1. **Clone this repository**
   ```bash
   git clone https://github.com/kwhra/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Run the installation script**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Restart your shell**
   ```bash
   source ~/.zshrc
   ```
   Or simply close and reopen your terminal.

## 🎨 Features

### Zsh Configuration

- **Oh My Zsh Integration**: Configured with Git plugin and custom theme
- **Smart Completion**: Case-insensitive and hyphen-insensitive completion
- **Auto-correction**: Suggests corrections for mistyped commands
- **Custom Aliases**: Enhanced `ls`, `grep`, and other common commands with color support
- **Safe Delete**: `rm` command moves files to trash instead of permanent deletion

### Shimaenaga Theme

The custom theme features:
- **Dynamic Character**: Displays a happy face (˶• ▴ •˶) on success, sad face (˶> ▴ <˶) on error
- **Git Integration**: Shows current branch and repository status
- **Clean Layout**: Two-line prompt for better readability

### Git Configuration

Includes useful settings and aliases:
- **Aliases**: `st` (status), `ci` (commit), `co` (checkout), `br` (branch)
- **Pretty Logs**: `lg` and `lga` for beautiful commit history visualization
- **Smart Defaults**: Auto-setup remote tracking, histogram diff algorithm

### Safe Trash Function

The custom `rm` function provides a safety net:
- Moves files to `~/.trash` instead of permanent deletion
- Warns when trash directory exceeds 1GB
- Recover accidentally deleted files from `~/.trash`

To permanently delete files, use: `/bin/rm -rf ~/.trash/*`

## 🛠️ Customization

### Modifying Configurations

All configuration files are symlinked from this repository to your home directory. To make changes:

1. Edit files in the dotfiles repository
2. Changes take effect immediately (or run `source ~/.zshrc`)

### Adding More Aliases

Edit `zsh/.zshrc_aliases` to add your custom aliases or functions.

### Changing Git User Information

Edit `gitconfig/.gitconfig` and update the `[user]` section with your information:
```gitconfig
[user]
    email = your.email@example.com
    name = Your Name
```

## 🔧 Troubleshooting

### Theme Not Showing

**Problem**: The Shimaenaga theme doesn't appear after installation.

**Solution**:
1. Ensure Oh My Zsh is installed: `ls ~/.oh-my-zsh`
2. Verify theme is linked: `ls -l ~/.oh-my-zsh/custom/themes/`
3. Restart your shell: `source ~/.zshrc`

### Symlink Conflicts

**Problem**: Installation fails due to existing configuration files.

**Solution**: The installation script automatically creates backups in `~/.dotfiles_backup_YYYYMMDD_HHMMSS/`. You can:
- Review backed-up files: `ls ~/.dotfiles_backup_*`
- Merge custom settings from backups into the new configuration
- Remove backups once satisfied: `rm -rf ~/.dotfiles_backup_*`

### PATH Not Updated

**Problem**: Commands installed in custom locations aren't found.

**Solution**:
1. Check `.zprofile_path` configuration
2. Verify Volta or other tools are installed in expected locations
3. Source the profile: `source ~/.zprofile`

### Trash Directory Growing Too Large

**Problem**: `~/.trash` directory is consuming too much space.

**Solution**: Permanently delete trash contents:
```bash
/bin/rm -rf ~/.trash/*
```

### Oh My Zsh Not Found

**Problem**: Installation warns that Oh My Zsh is not installed.

**Solution**: Install Oh My Zsh first:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
Then run `./install.sh` again.

## 📝 Maintenance

### Updating Dotfiles

To get the latest updates:
```bash
cd ~/dotfiles
git pull origin main
./install.sh  # Reinstall if needed
```

### Uninstalling

To remove the dotfiles:
1. Remove symlinks: `rm ~/.zshrc ~/.zprofile ~/.gitconfig`
2. Restore Oh My Zsh defaults or your previous configuration
3. Remove the repository: `rm -rf ~/dotfiles`

## 📄 License

Feel free to use and modify these dotfiles for your personal use.

## 🤝 Contributing

Suggestions and improvements are welcome! Please feel free to submit issues or pull requests.

## 📮 Contact

- GitHub: [@kwhra](https://github.com/kwhra)
- Email: pkzmnz7zo@toki.waseda.jp
