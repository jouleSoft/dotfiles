#!/bin/sh
#
# pctl-playPause.sh
# 
# Depenencies:
# -----------
# - community/playerctl (https://github.com/altdesktop/playerctl)
#
#

[ "$(playerctl status)" == "Playing" ] && playerctl pause
[ "$(playerctl status)" == "Paused" ] && playerctl play
