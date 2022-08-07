#!/bin/zsh

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx ~/.config/X11/xinitrc
fi
