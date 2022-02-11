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
".config/dunst/dunstrc"
".config/fish/conf.d/dracula.fish"
".config/fish/config.fish"
".config/fish/fish_variables"
".config/gtk-3.0/gtk.css"
".config/i3status-rust/config.toml"
".config/i3status/config"
".config/js-check-repo.conf.sh"
".config/js-dotfiles-bkp.conf.sh"
".config/kitty/kitty.conf"
".config/kitty/diff.conf"
".config/kitty/dracula.conf"
".config/kitty/kitty-themes"
".config/nvim/init.vim"
".config/picom.conf"
".config/polybar/config"
".config/polybar/launch.sh"
".config/polybar/spotify_status.py"
".config/qtile/autostart.sh"
".config/qtile/config.py"
".config/ranger/commands.py"
".config/ranger/commands_full.py"
".config/ranger/rc.conf"
".config/ranger/rifle.conf"
".config/ranger/scope.sh"
".config/rofi/config.rasi"
".config/rofi/arc_dark_colors.rasi"
".config/rofi/arc_dark_transparent_colors.rasi"
".config/rofi/powermenu.rasi"
".config/rofi/rofidmenu.rasi"
".config/starship.toml"
)

#dotfiles from '~/.config/conky' directory
declare -a dotConfig_conky=(
".config/conky/conky.conf"
".config/conky/i3-legend.conf"
".config/conky/scripts/check-connection.sh"
".config/conky/scripts/conky-plasma.sh"
)

#dotfiles from '~/.config/i3' directory
declare -a dotConfig_i3wm=(
".config/i3/config"
".config/i3/i3blocks.conf"
".config/i3/keybindings"
".config/i3/includes/keybindings"
".config/i3/includes/i3bar"
".config/i3/includes/polybar"
".config/i3/scripts/dmApplications.sh"
".config/i3/scripts/dmConfig.sh"
".config/i3/scripts/dmDocs.sh"
".config/i3/scripts/dmScripts.sh"
".config/i3/scripts/dmUrl.sh"
".config/i3/scripts/dunstify-volume.sh"
".config/i3/scripts/pctl-playPause.sh"
".config/i3/scripts/volume"
".config/i3/scripts/vpn"
".config/i3/scripts/keyhint.sh"
".config/i3/scripts/bandwidth2"
".config/i3/scripts/battery.sh"
".config/i3/scripts/blur-lock.sh"
".config/i3/scripts/cpu_usage"
".config/i3/scripts/disk"
".config/i3/scripts/empty_workspace.sh"
".config/i3/scripts/memory"
".config/i3/scripts/openweather.sh"
".config/i3/scripts/openweather.conf"
".config/i3/scripts/powermenu"
".config/i3/scripts/temperature"
".config/i3/storage_room/config_endeavouros"
)

#dotfiles from '~/.doom.d' directory
declare -a dotDoom=(
".doom.d/config.el"
".doom.d/custom.el"
".doom.d/init.el"
".doom.d/packages.el"
)

#dotfiles from '~/.local' directory
declare -a dotLocal=(
".local/share/xfce4/terminal/colorschemes/Dracula.theme"
".local/share/fonts/DejaVu Sans Mono Nerd Font Complete Mono.ttf"
".local/share/konsole"
)

#Avoid spaces as array element separator
IFS=""
