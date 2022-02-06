#!/usr/bin/env bash
# ---
# Title:        dmUrl.sh
# Description:  Open an url from a list
# Contributors: Julio Jimenez Delgado (jouleSoft)
#
# GitHub:		https://github.com/jouleSoft/i3-dotfiles
#
# License:      The MIT License (MIT)
#               Copyright (c) 2021 Julio Jiménez Delgado (jouleSoft)
#
# Template:     template_noargs.sh <https://github.com/jouleSoft/js-DevOps/templates/>
#
# Dependencies: dmenu
# 
# Version:      0.1
# Author:       Julio Jimenez Delgado
# Date:         02/04/2021
# Change:       Initial development
# 
#

#----------------------------------[Declarations and definitions]----------------------------------

#Script info and arguments evaluation variables
script_name="dmUrl.sh"
version="v.0.1"
description="Open an url from a list"

#Global operational variables
# NAV="firefox"
# NAV="surf"
NAV="vimb"

# An array of optiones to choose.
# You can edit this list to add/remove config files.
declare -a options=(
"Alacritty conf   | https://gist.github.com/Cogitri/e8d5c63818443f3c8f13cd7760fe77aa"
"Arch Linux       | https://archlinux.org"
"conky:Arch Linux | https://wiki.archlinux.org/title/Conky"
"conky:el-atareao | https://www.atareao.es/blog/"
"conky:linux.com  | https://www.linux.com/topic/desktop/how-install-and-configure-conky/"
"doom-emacs       | https://github.com/hlissner/doom-emacs"
"duckduckgo       | https://duckduckgo.com"
"el-atareao       | https://www.atareao.es/blog/"
"Font Awesome     | https://fontawesome.com/v4.7.0/cheatsheet/"
"i3               | https://i3wm.org/docs/userguide.html"
"i3status         | https://i3wm.org/i3status/manpage.html"
"i3status-rust    | https://github.com/greshake/i3status-rust"
"libvirt-Arch     | https://wiki.archlinux.org/title/Libvirt"
"mermaid          | https://mermaid-js.github.io/mermaid/#/Tutorials"
"pihole           | http://172.29.0.2/admin"
"polybar          | https://github.com/polybar/polybar/wiki"
"qtile            | https://docs.qtile.org/en/latest/"
"Shell Scripting  | https://devhints.io/bash"
"sigma-syncthing  | https://10.13.13.3:8384"
"sigma-cockpit    | https://10.13.13.3:9090"
"vim-awesome      | https://vimawesome.com/"
"vim-config       | https://vimconfig.com/"
"vim-leaderkey    | https://tuckerchapman.com/2018/06/16/how-to-use-the-vim-leader-key/"
"vim-plug         | https://github.com/junegunn/vim-plug"
"wordreference    | https://www.wordreference.com/"
"xrandr-config    | https://blog.stigok.com/2017/08/14/multimonitor-setup-with-i3-and-xrandr-on-arch-linux.html"
"quit"
)

#-------------------------------------------[Functions]--------------------------------------------

#Script header
header() 
{
  #Init color variables
  NC='\033[0m'
  LIGHT_GREY='\033[0;37m'
  YELLOW='\033[1;33m'

  echo 
  echo -e "${LIGHT_GREY} $script_name ${YELLOW}$version ${LIGHT_GREY}- $description${NC}\n"
  echo 
}

#Operational functions (if required)

#Main function
main()
{
  # Piping options array into dmenu.
  # We use "printf '%s\n'" to format the array one item to a line.
  choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -nf '#F8F8F2' -nb '#282A36' -sb '#6272A4' -sf '#F8F8F2' -p 'Open WWW:')

  # What to do when/if we choose 'quit'.
  if [ "$choice" == "quit" ]; then
    echo "Program terminated." && exit 1

  elif [ "$choice" == "pihole           | http://172.29.0.2/admin" ]; then
    cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    firefox "$cfg"

  elif [ "$choice" == "sigma-syncthing  | https://10.13.13.3:8384" ]; then
    cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    firefox "$cfg"

  elif [ "$choice" == "sigma-cockpit    | https://10.13.13.3:9090" ]; then
    cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    firefox "$cfg"

  # What to do when/if we choose a file to edit.
  elif [ "$choice" ]; then
    cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
    $NAV "$cfg"

  # What to do if we just escape without choosing anything.
  else
    echo "Program terminated." && exit 1
  fi
}

#-------------------------------------------[Execution]--------------------------------------------


#Printing the header
header

#Main function execution
main


#------------------------------------------[Finalization]------------------------------------------

#Script header
unset script_name
unset version
unset description

#Operational variables (if any)
unset DMEDITOR
unset options
