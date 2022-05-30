#!/usr/bin/env bash


declare picom_status
picom_status="$(pgrep -cu $USER picom)"

if [ "$picom_status" -eq 0 ]; then
  picom -CGb && exit 0

else
  pkill -u "$USER" picom  && exit 0

fi

