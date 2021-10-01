#!/usr/bin/env bash
# ---
# Title:        dmApplications.sh
# Description:  Launch an application from a list
# Contributors: Julio Jimenez Delgado (jouleSoft)
#
# GitHub:	https://github.com/jouleSoft/i3-dotfiles
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
script_name="dmApplications.sh"
version="v.0.1"
description="Launch an application from a list"

#Global operational variables
# An array of optiones to choose.
# You can edit this list to add/remove config files.
declare -a options=(
"bitwarden       | /usr/bin/bitwarden-desktop"
"chrome          | /usr/bin/google-chrome-stable"
"emacs           | /usr/bin/emacs"
"firefox         | /usr/bin/firefox"
"Joplin          | /var/lib/snapd/snap/bin/joplin-desktop"
"keepass         | /usr/bin/keepass"
"kitty           | /usr/bin/kitty"
"jupyter-lab     | /usr/bin/jupyter-lab"
"libreOffice     | /usr/bin/libreoffice"
"mysql-workbench | /usr/bin/mysql-workbench"
"putty           | /usr/bin/putty"
"remmina         | /usr/bin/remmina"
"spotify         | /var/lib/snapd/snap/bin/spotify"
"telegram        | /usr/bin/telegram-desktop"
"teams           | /usr/bin/teams"
"thunar          | /usr/bin/thunar"
"transmission    | /usr/bin/transmission-gtk"
"virt-manager    | /usr/bin/virt-manager"
"xfce4-terminal  | /usr/bin/xfce4-terminal"
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
	choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -nf '#F8F8F2' -nb '#282A36' -sb '#6272A4' -sf '#F8F8F2' -p 'Run app:')

	# What to do when/if we choose 'quit'.
	if [ "$choice" == "quit" ]; then
		echo "Program terminated." && exit 1

	# What to do when/if we choose a file to edit.
	elif [ "$choice" ]; then
		cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')

	# What to do if we just escape without choosing anything.
	else
		echo "Program terminated." && exit 1
	fi


	# What to do when/if we choose ranger
	if [ "$cfg" == "/home/jjimenez/.config/i3/umenu-term-apps.sh" ]; then
		alacritty -e /home/jjimenez/.config/i3/umenu-term-apps.sh

	# When/if we choose another application
	else
		$cfg
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
unset options
