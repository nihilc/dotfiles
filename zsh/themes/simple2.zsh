#!/bin/zsh

# Load version control information
autoload -Uz colors && colors -u
autoload -Uz vcs_info
precmd() {vcs_info}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats "%{$fg[green]%}שׂ %b%{$reset_color%}"

# Format the prompt
sep1r='%F{05}%f'
sep2r='%F{04}%S%s%f'
sep3r='%F{04}%f'
ZSH_THEME_USER='%F{05}%B%S  %n %s%b%f'
ZSH_THEME_DIR='%F{04}%B%S  %3~ %s%b%f'

setopt PROMPT_SUBST
PROMPT='${ZSH_THEME_USER}${sep1r}${sep2r}${ZSH_THEME_DIR}${sep3r} '
RPROMPT='${vcs_info_msg_0_}'
