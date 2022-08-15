#!/bin/zsh

### Config ###
source $ZDOTDIR/config/settings
### Plugins ###
source $ZDOTDIR/plugins/plugins
### Keybinds ###
source $ZDOTDIR/config/keybinds
### Aliases ###
source $ZDOTDIR/config/aliases
### PROMPT ###
ZSH_THEME="simple4"
source $ZDOTDIR/themes/$ZSH_THEME.zsh
### LOGIN ###
## Show beam cursor in new prompt
precmd(){echo -ne '\e[5 q'}
