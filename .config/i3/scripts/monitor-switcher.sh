#!/usr/bin/env bash

# -------------------------------------------------------------------
#   BASH REQUIREMENTS
# -------------------------------------------------------------------
#
# -e             Scripts stops on error (return != 0)
# -u             Error if undefined variable
# -x             Output every line (debug mode)
# -o pipefail    Script fails if one of the piped commands fails
# -o posix       Causes Bash to match the standard when the
#                default operation differs from the Posix standard

set -eu -o pipefail -o posix

# -------------------------------------------------------------------
#   DECLARATIONS AND DEFINITIONS
# -------------------------------------------------------------------

declare monNumbers
monNumbers=$(xrandr --listmonitors | grep -ivc -e "Monitors:")

case $monNumbers in
    1) nonPrimary="";;
    2)
        nonPrimary=$(xrandr --listmonitors | tail -1 | awk '{print $NF}')

        if [ "$(xrandr -q | grep -i -e "$nonPrimary" | cut -d ' ' -f 2)" != "connected" ]; then
            nonPrimary=""
        fi
    ;;
esac

# -------------------------------------------------------------------
#   EXECUTION
# -------------------------------------------------------------------

case $nonPrimary in
    HDMI-A-0)
        xrandr \
            --output eDP \
            --primary \
            --mode 1920x1080 \
            --pos 2560x0 \
            --rotate normal \
            --output HDMI-A-0 \
            --mode 2560x1080 \
            --pos 0x0 \
            --rotate normal
    ;;

    *) xrandr \
            --output eDP \
            --primary \
            --mode 1920x1080 \
            --pos 0x0 \
            --rotate normal \
        ;;
esac
