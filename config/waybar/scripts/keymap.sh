#!/usr/bin/env bash

LAYOUT=$(hyprctl devices | rg -A2 'sino-wealth-gaming-kb-' | rg -m1 'keymap' | awk '{print $3}')
[[ "$LAYOUT" == "English" ]] && echo "US" || echo "ES"
