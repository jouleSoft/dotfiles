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
".config/alacritty/alacritty.yml"
".config/alacritty/dracula.yml"
".config/alacritty/template.yml"
".config/conky/conky.conf"
".config/dunst/dunstrc"
".config/fish/config.fish"
".config/fish/fish_variables"
".config/gtk-3.0/gtk.css"
".config/i3status-rust/config.toml"
".config/i3status/config"
".config/i3/config"
".config/i3/dmApplications.sh"
".config/i3/dmConfig.sh"
".config/i3/dmDocs.sh"
".config/i3/dmScripts.sh"
".config/i3/dmUrl.sh"
".config/i3/dunstify-volume.sh"
".config/i3/pctl-playPause.sh"
".config/i3/umenu-term-apps.sh"
".config/js-check-repo.conf.sh"
".config/js-dotfiles-bkp.conf.sh"
".config/kitty/diff.conf"
".config/kitty/dracula.conf"
".config/kitty/kitty.conf"
".config/nvim/init.vim"
".config/picom.conf"
".config/polybar/config"
".config/polybar/launch.sh"
".config/polybar/spotify_status.py"
".config/qtile/config.py"
".config/qtile/autostart.sh"
".config/ranger/commands.py"
".config/ranger/commands_full.py"
".config/ranger/rc.conf"
".config/ranger/rifle.conf"
".config/ranger/scope.sh"
".config/rofi/config.rasi"
".config/starship.toml"
)

#dotfiles from '~/.doom.d' directory
declare -a dotDoom=(
".doom.d/init.el"
".doom.d/config.el"
".doom.d/custom.el"
".doom.d/packages.el"
)

#dotfiles from '~/.local' directory
declare -a dotLocal=(
".local/share/xfce4/terminal/colorschemes/Dracula.theme"
".local/share/fonts/DejaVu Sans Mono Nerd Font Complete Mono.ttf"
)

#Avoid spaces as array element separator
IFS=""
