#!/bin/zsh
autoload -Uz colors && colors -u
autoload -Uz vcs_info

# Format the vcs_info_msg_0_ variable
# ✔ ✘ ✚ ✖
zstyle ':vcs_info:*' enable git

theme_precmd () {
  if [[ -z $(git status -s 2> /dev/null) ]]; then
    zstyle ':vcs_info:git:*' formats '%F{#1a1b26}%K{02} שׂ %b ✔ %k%f%F{02}%K{#1a1b26}%k%f'
  else
    zstyle ':vcs_info:git:*' formats '%F{#1a1b26}%K{02} שׂ %b ✘ %k%f%F{02}%K{#1a1b26}%k%f'
  fi
  vcs_info
}

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

# Format the prompt
ZSH_THEME_NL=$'\n'
ZSH_THEME_USER='%F{#1a1b26}%K{05}  %n %k%f%F{05}%f'
ZSH_THEME_DIR='%F{04}%S%s%f%F{#1a1b26}%K{04}  %3~ %k%f%F{04}%f'
ZSH_THEME_INPUT='%F{02}%B%b%f '

setopt PROMPT_SUBST
PROMPT='${ZSH_THEME_USER}${ZSH_THEME_DIR}${vcs_info_msg_0_}${ZSH_THEME_NL}${ZSH_THEME_INPUT}'
