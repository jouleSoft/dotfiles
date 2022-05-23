#!/usr/bin/env bash

/usr/bin/snap refresh --list|grep -v -e Version | yad --list --title "Snap Updates" --text "Availiable Snap updates" --column "Snaps" --no-headers

[ "$?" -eq 0 ] && xfce4-terminal -e "sudo snap refresh"
