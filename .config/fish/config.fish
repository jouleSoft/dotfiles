# ================================================================================== #
#                                                                                    #
# TITLE:  Fish config file
# AUTHOR: Julio Jiménez Delgado (jouleSoft)                                          #
# UPDATE: 2021-03-19                                                                 #
#                                                                                    # 
# ================================================================================== #


#################
### VARIABLES ###
#################

# FISH VARIABLES
# --------------
set fish_greeting ""

# ENVIRONMENT VARIABLES
# ---------------------

# PATH appends
set -a --export PATH "$HOME/github/js-sh"
set -a --export PATH "$HOME/.emacs.d/bin"

# js-sh
set --export jsSh "/home/jjimenez/github/js-sh"
# dotfiles
set --export jsdotfiles "/home/jjimenez/github/dotfiles"

###############
### ALIASES ###
###############

# Commands
alias bat='bat --theme Dracula'
alias cp='cp -vi'                   # Verbose and interactiva if overwrite
alias free='free -m'                # Show values in mebibytes
alias la='ls -lh'                   # List layout,  human readable and hidden files
alias ll='ls -lha'                  # List layout and human readable
alias ls='exa'                      # Use 'exa' instead 'ls'
alias mv='mv -vi'                   # Verbose and interactiva if overwrite
alias rm='rm -v'                    # Verbose

# Recalbox http/ssh aliases
alias rbox='/usr/bin/firefox http://recalbox'
alias rbox-kodi='/usr/bin/firefox http://recalbox:8081'
alias rbox-ssh='/usr/bin/ssh root@recalbox'

################
### AUTOEXEC ###
################

# starship prompt
starship init fish | source
