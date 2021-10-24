#!/usr/bin/env bash

# ~/.config/js-dotfiles-bkp.conf.sh


#dotfiles from '~/' directory
declare -a dotFiles=(
".bashrc"
".zshrc"
".vim/vimrc"
)

#dotfiles from '~/.config' directory
declare -a dotConfig=(
".config/alacritty"
".config/conky"
".config/dunst/dunstrc"
".config/fish"
".config/gtk-3.0/gtk.css"
".config/i3status-rust/config.toml"
".config/i3status/config"
".config/i3"
".config/js-check-repo.conf.sh"
".config/js-dotfiles-bkp.conf.sh"
".config/kitty"
".config/nvim/init.vim"
".config/picom.conf"
".config/polybar"
".config/qtile"
".config/qtile"
".config/ranger"
".config/rofi/config.rasi"
".config/starship.toml"
)

#dotfiles from '~/.doom.d' directory
declare -a dotDoom=(
".doom.d"
)

#dotfiles from '~/.local' directory
declare -a dotLocal=(
".local/share/xfce4/terminal/colorschemes/Dracula.theme"
".local/share/fonts/DejaVu Sans Mono Nerd Font Complete Mono.ttf"
".local/share/konsole"
)

#Avoid spaces as array element separator
IFS=""
