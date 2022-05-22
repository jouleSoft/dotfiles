#!/usr/bin/env bash


checkupdates+aur |yad --list --title "Updates" --text "Availiable updates" --column "Arch+AUR" --no-headers

[ "$?" -eq 0 ] && xfce4-terminal -e "paru -Syu --noconfirm"
