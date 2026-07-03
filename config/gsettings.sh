#!/usr/bin/env bash
# Remove ctrl+alr+shift+up/down/left/right to move to workspaces
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up       "['<Super><Shift><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down     "['<Super><Shift><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left     "['<Super><Shift><Alt>Left', '<Super><Shift>Page_Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right    "['<Super><Shift><Alt>Right', '<Super><Shift>Page_Down']"
# Remove ctrl+alr+up/down/left/right to switch to workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up     "['<Super><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down   "['<Super><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left   "['<Super><Alt>Left', '<Super>Page_Up'] "
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right  "['<Super><Alt>Right', '<Super>Page_Down']"
# Change Screenshot bindings
gsettings set org.gnome.mutter.keybindings switch-monitor     "['XF86Display']" # remove super+p
gsettings set org.gnome.shell.keybindings show-screenshot-ui  "['<Super>p','Print']"
gsettings set org.gnome.shell.keybindings screenshot          "['<Super><Shift>p', '<Shift>Print']"
gsettings set org.gnome.shell.keybindings screenshot-window   "['<Super><Alt>p', '<Alt>Print']"
