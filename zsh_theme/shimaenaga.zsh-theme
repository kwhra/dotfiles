# face changes if previous command succeeded
SHIMAENAGA="%{$bg[white]$fg[black]%}%(?:%1{  ˶• ▴ •˶ %}:%1{  ˶> ▴ <˶ %})%{$reset_color%}"

PC_NAME="%{$fg[green]%}%n@%m%{$reset_color%}"

DIR="%{$fg_bold[cyan]%}%~%{$reset_color%}"

# l1: shimaenaga, pc name, dir
# l2: $ 
PROMPT='${SHIMAENAGA} ${PC_NAME}:${DIR} $(git_prompt_info)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
