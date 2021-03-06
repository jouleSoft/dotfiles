#!/usr/bin/env bash
# ---
# Title:        dmDocs.sh
# Description:  Choose from a list a document file to edit
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
# Date:         01/04/2021
# Change:       Initial development
# 
#

#----------------------------------[Declarations and definitions]----------------------------------

#Script info and arguments evaluation variables
script_name="dmDocs.sh"
version="v.0.1"
description="Choose from a list a document file to edit"

#Global operational variables
# Defining the text editor to use.
# DMEDITOR="vim"
# DMEDITOR="nvim"
# DMEDITOR="emacsclient -c -a emacs"
DMEDITOR="emacsclient -a emacs"

# An array of optiones to choose.
# You can edit this list to add/remove config files.
declare -a options=(
"notes   - english.org            | $HOME/MEGA/Documentos/notes/english.org"
"notes   - linux-wiki.org         | $HOME/MEGA/Documentos/notes/linux-wiki.org"
"notes   - LPIC-1.org             | $HOME/MEGA/Documentos/notes/LPIC-1.org"
"scripts - js-dotfiles-bkp.sh     | $HOME/github/js-DevOps/sh/js-dotfiles-bkp.sh"
"scripts - js-scripts-check.sh    | $HOME/github/js-DevOps/sh/js-scripts-check.sh"
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
	choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -nf '#F8F8F2' -nb '#282A36' -sb '#6272A4' -sf '#F8F8F2' -p 'Edit doc:')

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
