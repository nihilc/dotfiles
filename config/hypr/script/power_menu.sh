#!/usr/bin/env bash

options="Lock\nLogout\nSuspend\nHibernate\nReboot\nShutdown"

selected_option=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:")

case "$selected_option" in
    "Lock")
        hyprlock ;;
    "Logout")
        hyprctl dispatch exit ;;
    "Suspend")
        hyprlock & systemctl suspend ;;
    "Hibernate")
        hyprlock & systemctl hibernate ;;
    "Reboot")
        systemctl reboot ;;
    "Shutdown")
        systemctl poweroff ;;
    *)
        exit 1 ;;
esac
