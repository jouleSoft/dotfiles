#!/usr/bin/env bash


declare i3_legend_config_file
i3_legend_config_file="$1"

declare i3_legend_status
i3_legend_status="$(pgrep -au $USER conky | grep -c -i -e $i3_legend_config_file)"

if [ "$i3_legend_status" -eq 0 ]; then
  conky -c "$i3_legend_config_file" && exit 0

else
  kill -9 "$(pgrep -au $USER conky | grep -i -e $i3_legend_config_file | cut -d ' ' -f 1)" && exit 0

fi

