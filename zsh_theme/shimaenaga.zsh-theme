# ============================================================================
# Shimaenaga Zsh Theme
# ============================================================================
# A minimalist, kawaii-inspired theme featuring an expressive bird character
# that changes based on command execution status
#
# Features:
#   - Dynamic character face (happy/sad) based on last command exit status
#   - Git branch and status information
#   - Clean two-line prompt format
#   - Color-coded information display
# ============================================================================

# ----------------------------------------------------------------------------
# Character Definition
# ----------------------------------------------------------------------------
# The shimaenaga (long-tailed tit) character displays different expressions:
#   - Success (exit code 0): Happy face  ˶• ▴ •˶
#   - Failure (exit code ≠0): Sad face   ˶> ▴ <˶
SHIMAENAGA="%{$bg[white]$fg[black]%}%(?:%1{  ˶• ▴ •˶ %}:%1{  ˶> ▴ <˶ %})%{$reset_color%}"

# ----------------------------------------------------------------------------
# Prompt Components
# ----------------------------------------------------------------------------
# User and machine information in green
PC_NAME="%{$fg[green]%}%n@%m%{$reset_color%}"

# Current directory in bold cyan
DIR="%{$fg_bold[cyan]%}%~%{$reset_color%}"

# ----------------------------------------------------------------------------
# Prompt Format
# ----------------------------------------------------------------------------
# Line 1: [character] [user@machine]:[directory] [git info]
# Line 2: $ 
PROMPT='${SHIMAENAGA} ${PC_NAME}:${DIR} $(git_prompt_info)
$ '

# ----------------------------------------------------------------------------
# Git Prompt Configuration
# ----------------------------------------------------------------------------
# Branch name in bold yellow
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Show ✗ symbol for dirty (uncommitted changes) repositories
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}%1{✗%}"

# No indicator for clean repositories
ZSH_THEME_GIT_PROMPT_CLEAN=""
