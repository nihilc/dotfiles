#!/bin/bash

shutdown="shutdown"
reboot="reboot"
logout="logout"
suspend="suspend"
blockscreen="blockscreen"

OPTIONS="${shutdown}\n${reboot}\n${logout}\n${suspend}\n${blockscreen}"
ans=$(echo -e "${OPTIONS}" | rofi -p "Elige:" -dmenu)
rs=$?
if [ $rs -eq 0 ]
then
    case "$ans" in
        "$apagar")
            systemctl poweroff
            ;;
        "$reiniciar")
            systemctl reboot
            ;;
        "$suspender")
            systemctl suspend
            ;;
        "$bloquear")
			betterlockscreen -l
            ;;
        "$logout")
            bspc quit
            ;;
    esac
fi
