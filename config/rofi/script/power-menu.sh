#!/usr/bin/env bash

selected_option="$1"

if [ -z "$selected_option" ]; then
  echo -e "Lock\nLogout\nSuspend\nHibernate\nReboot\nShutdown"
  exit 0
fi

case "$selected_option" in
"Lock")
  hyprlock >/dev/null 2>&1
  ;;
"Logout")
  hyprctl dispatch exit >/dev/null 2>&1
  ;;
"Suspend")
  $(
    hyprlock &
    sleep 1
    systemctl suspend
  ) >/dev/null 2>&1
  ;;
"Hibernate")
  $(
    hyprlock &
    sleep 1
    systemctl hibernate
  ) >/dev/null 2>&1
  ;;
"Reboot")
  systemctl reboot >/dev/null 2>&1
  ;;
"Shutdown")
  systemctl poweroff >/dev/null 2>&1
  ;;
*)
  exit 1
  ;;
esac
