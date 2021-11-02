#!/usr/bin/env sh

# dunstify-volume.sh
#

dunstify "Volume $(amixer get Master|grep -Po "[0-9]+(?=%)"|tail -1)%" --timeout=1000 --replace=1000
