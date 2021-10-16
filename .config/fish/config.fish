#
# TITLE:  Fish config file
# AUTHOR: Julio Jiménez Delgado (jouleSoft) 
# UPDATE: 2021-03-19                       
#                                         
# ~/.config/fish/config.fish
#
# ** UTF-8 **
#                                         

#################
### VARIABLES ###
#################

# FISH VARIABLES
# --------------
set fish_greeting ""

# ENVIRONMENT VARIABLES
# ---------------------

# PATH appends
set -a --export PATH "$HOME/workspace/bash-scripts"
set -a --export PATH "$HOME/.emacs.d/bin"
set -a --export PATH "$HOME/.local/share/gem/ruby/3.0.0/bin"

# github_uri
set --export github_repo "https://github.com/jouleSoft"
# github
set --export github "$HOME/workspace"
# js-sh
set --export js_sh "$HOME/workspace/bash-scripts"
# dotfiles
set --export jsdotfiles "$HOME/workspace/dotfiles"

###############
### ALIASES ###
###############

# Commands
alias bat='bat --theme "Monokai Extended"'            # Set color theme for bat
alias cp='cp -vi'                                   # Verbose and interactiva if overwrite
alias free='free -m'                                # Show values in mebibytes
alias history-uniq='history|sort|uniq|batcat'       # Show history but uniq view and sorted
alias la='ls -lh'                                   # List layout,  human readable and hidden files
alias ll='ls -lha'                                  # List layout and human readable
alias ls='exa'                                      # Use 'exa' instead 'ls'
alias mv='mv -vi'                                   # Verbose and interactive if overwrite
alias rm='rm -v'                                    # Verbose

# Recalbox http/ssh aliases
alias rbox='/usr/bin/firefox http://recalbox'
alias rbox-kodi='/usr/bin/firefox http://recalbox:8081'
alias rbox-ssh='/usr/bin/ssh root@recalbox'

# Imported aliases
if test -e "$HOME/MEGA/Scripts/fish.aliases"
  . "$HOME/MEGA/Scripts/fish.aliases"
end

################
### AUTOEXEC ###
################

# starship prompt
starship init fish | source
