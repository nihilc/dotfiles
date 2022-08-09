#!/bin/zsh
autoload -Uz colors && colors -u
autoload -Uz vcs_info
precmd() {vcs_info}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats "%K{02}%F{#1a1b26} שׂ %b %f%k%F{02}%K{#1a1b26}%k%f"

# Format the prompt
ZSH_THEME_SP1='%F{05}%f'
ZSH_THEME_SP2='%F{04}%S%s%f'
ZSH_THEME_SP3='%F{04}%f'
ZSH_THEME_NL=$'\n'
ZSH_THEME_USER='%F{05}%B%S  %n %s%b%f'
ZSH_THEME_DIR='%F{04}%B%S  %3~ %s%b%f'
ZSH_THEME_INPUT='%F{02}%B%b%f '

setopt PROMPT_SUBST
PROMPT='${ZSH_THEME_USER}${ZSH_THEME_SP1}${ZSH_THEME_SP2}${ZSH_THEME_DIR}${ZSH_THEME_SP3}%B${vcs_info_msg_0_}%b${ZSH_THEME_NL}${ZSH_THEME_INPUT}'
