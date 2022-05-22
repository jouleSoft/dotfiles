#!/usr/bin/env bash
# ---
# Title:        umenu-term-apps.sh
# Description:  Simple application launcher
# Contributors: Julio Jimenez Delgado
#
# GitHub repo:	https://github.com/jouleSoft/<repo-name>
#
# License:      The MIT License (MIT)
#               Copyright (c) 2021 Julio Jiménez Delgado (jouleSoft)
#
# Template:     template_noargs.sh <https://github.com/jouleSoft/js-DevOps/templates/>
#
# Dependencies: umenu (https://github.com/JCoMcL/umenu.git)
# 
# Version:      0.1
# By:           Julio Jimenez Delgado
# Date:         07/05/2021
# Change:       Initial development
# 
#

#----------------------------------[Declarations and definitions]----------------------------------

#Script info and arguments evaluation variables
script_name="umenu-term-apps.sh"
version="v.0.1"
description="Simple application launcher"

#Global operational variables
declare -a options=(
"doom-doctor      | Doom Emacs doctor"
"doom-sync        | Doom Emacs sync"
"ncdu             | Disk usage analyzer writen in rust"
"nmtui            | Disk usage analyzer writen in rust"
"ranger           | Ranger File Manager"
"updates          | System and applications updates"
"quit             | Exit"
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
#

#Main function
main()
{
	# Piping options array into umenu.
	# We use "printf '%s\n'" to format the array one item to a line.
	choice=$(printf '%s\n' "${options[@]}" | umenu -q --display="Select an application")

	# What to do when/if we choose 'quit'.
	if [ "$choice" == "quit" ]; then
		echo "Program terminated." && exit 1

	# What to do when/if we choose a file to edit.
	# With "awk '{print $NF}'" we select the last field
	elif [ "$choice" ]; then
		cfg=$(printf '%s\n' "${choice}" | awk '{print $1}')

	# What to do if we just escape without choosing anything.
	else
		echo "Program terminated." && exit 1
	fi

	# When/if we choose ncdu
	if [ "$cfg" == "ncdu" ]; then
		/usr/bin/ncdu ~

	# When/if we choose quit
	elif [ "$cfg" == "quit" ]; then
		echo
		echo "Program terminated." && exit 0

	# When/if we choose paru-updater
	elif [ "$cfg" == "updates" ]; then
		echo
		paru -Syu; sleep 3
		# doom sync and flatpak update should be executed after it

	# When/if we choose doom-doctor
	elif [ "$cfg" == "doom-doctor" ]; then
		echo
		/home/jjimenez/.emacs.d/bin/doom doctor; sleep 3

	# When/if we choose doom-sync
	elif [ "$cfg" == "doom-sync" ]; then
		echo
		/home/jjimenez/.emacs.d/bin/doom sync; sleep 3

	# When/if we choose another application
	else
		"$(which "$cfg")"
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
#

