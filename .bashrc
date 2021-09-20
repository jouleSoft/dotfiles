#
# ~/.bashrc
#

#### [ CONFIGURATIONS ] ####

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#### [ EXPORTS ] ####

# PATH
export PATH="$PATH:$HOME/workspace/bash-scripts"

# github repo uri
export jsrepo='https://github.com/joulesoft'

# make default editor Neovim
export EDITOR=nvim

# use custom fd command for fzf incl. showing hidden files by default
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

#### [ MODULES ] ####

# source ~/.bash_aliases

#### [ ALIASES ] ####

alias ls='ls --color=auto'
alias ll='ls -lha'

#### [ PROMPT ] ####

# configure silver command prompt
---
# export SILVER_ICONS=nerd
# source <(silver init)

PS1='[\u@\h \W]\$ '

