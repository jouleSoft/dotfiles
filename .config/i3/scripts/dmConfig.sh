#!/usr/bin/env bash
# ---
# Title:        dmConfig.sh
# Description:  Choose from a list of configuration files to edit
# Contributors: Derek Taylor
#               Julio Jimenez Delgado (jouleSoft)
#
# GitHub:		https://github.com/jouleSoft/i3-dotfiles
# GitLab:		https://gitlab.com/dwt1/dmscripts
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
# Date:         01/04/2021
# Change:       Initial development
# 
#

#----------------------------------[Declarations and definitions]----------------------------------

#Script info and arguments evaluation variables
script_name="dmConfig.sh"
version="v.0.1"
description="Choose from a list of configuration files to edit"

declare DMEDITOR

#Global operational variables
# Defining the text editor to use.
# DMEDITOR="xfce4-terminal -e /usr/bin/nvim"
DMEDITOR="kitty /usr/bin/nvim"
# DMEDITOR="emacsclient -c -a emacs"
# DMEDITOR="emacsclient -a emacs"

# An array of optiones to choose.
# You can edit this list to add/remove config files.
declare -a options=(
"alacritty              | $HOME/.config/alacritty/alacritty.yml"
"bash                   | $HOME/.bashrc"
"conky                  | $HOME/.config/conky/conky.conf"
"conky i3-legend        | $HOME/.config/conky/i3-legend.conf"
"doom emacs config.el   | $HOME/.doom.d/config.el"
"doom emacs init.el     | $HOME/.doom.d/init.el"
"doom emacs packages.el | $HOME/.doom.d/packages.el"
"dunst                  | $HOME/.config/dunst/dunstrc"
"fish                   | $HOME/.config/fish/config.fish"
"i3                     | $HOME/.config/i3/config"
"i3-bar                 | $HOME/.config/i3/includes/i3bar"
"i3-keybindings         | $HOME/.config/i3/includes/keybindings"
"i3blocks               | $HOME/.config/i3/i3blocks.conf"
"i3-dmApplcations       | $HOME/.config/i3/scripts/dmApplications.sh"
"i3-dmConfig            | $HOME/.config/i3/scripts/dmConfig.sh"
"i3-dmDocs              | $HOME/.config/i3/scripts/dmDocs.sh"
"i3-dmScripts           | $HOME/.config/i3/scripts/dmScripts.sh"
"i3-dmUrl               | $HOME/.config/i3/scripts/dmUrl.sh"
"i3-dunstify-volume     | $HOME/.config/i3/scripts/dunstify-volume.sh"
"i3-pctl-playPause      | $HOME/.config/i3/scripts/pctl-playPause.sh"
"i3-umenu-term-apps     | $HOME/.config/i3/scripts/umenu-term-apps.sh"
"i3status-rust-1        | $HOME/.config/i3status-rust/config.toml"
"i3status-rust-2        | $HOME/.config/i3status-rust/config2.toml"
"i3status               | $HOME/.config/i3status/config"
"js-dotfiles            | $HOME/.config/js-dotfiles-bkp.conf.sh"
"js-repos               | $HOME/.config/js-check-repo.conf.sh"
"kitty                  | $HOME/.config/kitty/kitty.conf"
"neovim                 | $HOME/.config/nvim/init.vim"
"picom                  | $HOME/.config/picom.conf"
"polybar                | $HOME/.config/polybar/config"
"qtile                  | $HOME/.config/qtile/config.py"
"qtile-autostart        | $HOME/.config/qtile/autostart.sh"
"ranger                 | $HOME/.config/ranger/rc.conf"
"vim                    | $HOME/.vim/vimrc"
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
	choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -nf '#F8F8F2' -nb '#282A36' -sb '#6272A4' -sf '#F8F8F2' -p 'Edit config:')

	# What to do when/if we choose 'quit'.
	if [ "$choice" == "quit" ]; then
		echo "Program terminated." && exit 1

		# What to do when/if we choose a file to edit.
	elif [ "$choice" ]; then
		cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
		$DMEDITOR "$cfg"

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
