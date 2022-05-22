#!/usr/bin/env bash

declare wg_instance
wg_instance=$(ps aux | grep -i -e wg-crypt | grep -v -e grep | awk '{print $NF}' | sed -e 's/\[//' -e 's/\]//' | grep -e ^wg-crypt-joules)

if [ -n "$wg_instance" ]; then
  /usr/bin/xfce4-terminal -e '/usr/bin/wg-quick down joulesoft'
else
  /usr/bin/xfce4-terminal -e '/usr/bin/wg-quick up joulesoft'
fi

