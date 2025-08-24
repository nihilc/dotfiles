#!/usr/bin/env bash

waybar &
swww-daemon & swww img ~/Pictures/wallpaper
swaync &
nm-applet &
gammastep &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
