#!/bin/zsh

autoload -Uz colors && colors -u

PROMPT="%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[blue]%}%m %{$fg_no_bold[cyan]%}%3~ %{$reset_color%}$ "
