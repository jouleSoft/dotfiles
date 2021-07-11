#!/bin/sh

setxkbmap es &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
picom -b -f -c &
conky &
nm-applet &
clipit &
blueman-applet &
xautolock -time 10 -locker blurlock &
syncthing-gtk &
udiskie --no-automount --no-notify --tray &
megasync &
pa-applet &
