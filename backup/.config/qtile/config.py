######################################################################################
######################################################################################
#                                                                                    #
#                       "        ""#        mmmm       m""  m                        #
#                     mmm mmm m   m#   mmm #"   " mmmmm#mmmm#mm                      #
#                       ##" "##   ##  #"  #"#mmm #" "# #    #                        #
#                       ##   ##   ##  #""""    "##   # #    #                        #
#                       #"#m#""mm"#"mm"#mm""mmm#""#m#" #    "mm                      #
#                       #                                                            #
#                     ""                                                             #
# ================================================================================== #
#                                                                                    #
# TITLE:       jouleSoft's qtile config file                                         #
# CONTRIBUTOR: Julio Jiménez Delgado (jouleSoft)                                     #
# UPDATE:      2021-04-11                                                            #
# REF:         https://docs.qtile.org/en/latest/manual/config/index.html             #
# GITHUB:      https://github.com/jouleSoft/qtile-dotfiles.git
#                                                                                    #
# Copyright (c) 2010 Aldo Cortesi                                                    #
# Copyright (c) 2010, 2014 dequis                                                    #
# Copyright (c) 2012 Randall Ma                                                      #
# Copyright (c) 2012-2014 Tycho Andersen                                             #
# Copyright (c) 2012 Craig Barnes                                                    #
# Copyright (c) 2013 horsik                                                          #
# Copyright (c) 2013 Tao Sauvage                                                     #
# Copyright (c) 2021 Julio Jiménez (jouleSoft)                                       #
#                                                                                    #
# Permission is hereby granted, free of charge, to any person obtaining a copy       #
# of this software and associated documentation files (the "Software"), to deal      #
# in the Software without restriction, including without limitation the rights       #
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell          #
# copies of the Software, and to permit persons to whom the Software is              #
# furnished to do so, subject to the following conditions:                           #
#                                                                                    #
# The above copyright notice and this permission notice shall be included in         #
# all copies or substantial portions of the Software.                                #
#                                                                                    #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR         #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,           #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE        #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER             #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,      #
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE      #
# SOFTWARE.                                                                          #
######################################################################################

# -.- ~/.config/qtile/config.py -.-

import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, extension, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal

#######################
### KEYBINDING INFO ###
#######################

# Key legend
# ------------------------
# Control-key = <control>
# Shift-key   = <shift>
# Alt-key     = <mod1>
# Super-key   = <mod4>
# Tab-key     = <Tab>
# Space-key   = <space>
# ------------------------

########################
### VARIABLE SETTING ###
########################

# --COLORS--
# General colors
color = "#383A59"
color_light = "#BD93F9"
color_light2 = "#EDEDED"
back = "#282A36"
# GroupBox colors
highlight_bg='BD93F9'
highlight_fg='282A36'
active_fg='BD93F9'
# Update colors
ups='BD93F9'
no_ups='383A59'

# --KEYS--
# set mod key
mod = "mod4"
alt = "mod1"

# --APPLICATIONS--
# Set terminal
#terminal = guess_terminal()
terminal1 = "xfce4-terminal"
terminal2 = terminal1 + " -e bash"
# set file manager
fmanager1 = terminal1 + " -e ranger"
fmanager2 = "thunar"
# set web browser
wbrowser1 = "vimb https://duckduckgo.com"
wbrowser2 = "firefox"
# Set launcher
launcher = "rofi\
        -lines 12\
        -padding 18\
        -width 60\
        -location 0\
        -show drun\
        -sidebar-mode\
        -columns 3\
        -font 'Ubuntu 10'"

keys = [
    #######################################################
    #         PRINCIPAL KEYBINDING CONFIGURATION          #
    #######################################################

    # |                   Return-Key                    | #
    # |-------------------------------------------------| #
    # |             Most used applications              | #
    #
    # Launch a Terminal
    Key([mod], "Return", lazy.spawn(terminal1), desc="Launch terminal1"),
    Key([mod, "shift"], "Return", lazy.spawn(terminal2), desc="Launch terminal2"),
    #
    # start a web browser
    Key([mod, alt], "Return", lazy.spawn(wbrowser1), desc="Launch wbrowser1"),
    #
    # firefox chord launcher
    KeyChord([mod, alt, "shift"], "Return", [
        Key([], "n", lazy.spawn("firefox")),
        Key([], "p", lazy.spawn("firefox --private-window"))],
        mode="Firefox"
    ),
    #
    # File Manager
    Key([mod, alt, "control"], "Return", lazy.spawn(fmanager1), desc="Launch fmanager1"),
    Key([mod, alt, "control", "shift"], "Return", lazy.spawn(fmanager2), desc="Launch fmanager2"),

    #######################################################
    #        LAUNCHERS KEYBINDINGS CONFIGURATION          #
    #######################################################

    # |                     P-Key                       | #
    # |-------------------------------------------------| #
    # |            Run application launcher             | #
    #
    # dmenu: launcher script for main applications
    Key([mod], "p", lazy.spawn("/home/jjimenez/.config/i3/dmApplications.sh"), desc="open app"),
    #
    # preference launcher mode (chord)
    #
    # rofi: run an application
    Key([mod, alt, "control"], "p", lazy.spawn(launcher), desc="Run launcher"),
    #
    # dmenu: launch in run mode
    Key([mod, alt, "control", "shift"], "p", lazy.run_extension(extension.DmenuRun(
        dmenu_prompt=">",
        dmenu_font="Ubuntu-11",
        background=back,
        foreground=color_light2,
        selected_background=color,
        selected_foreground=color_light2,
        )),
        desc="Launching an application with 'dmenu'"),

    # |                      I-Key                      | #
    # |-------------------------------------------------| #
    # |Run editor/viewer  launcher for specific pourpose| #
    #
    # dmenu: config file edition dmenu launcher
    Key([mod], "i", lazy.spawn("/home/jjimenez/.config/i3/dmConfig.sh"), desc="config edit"),
    #
    # dmenu: docs edition/view dmenu launcher
    Key([mod, alt], "i", lazy.spawn("/home/jjimenez/.config/i3/dmDocs.sh"), desc="config edit"),

    # |                      O-Key                      | #
    # |-------------------------------------------------| #
    # |  Run web browser launcher for specific pourpose | #
    #
    # dmenu: url dmenu launcher
    Key([mod], "o", lazy.spawn("/home/jjimenez/.config/i3/dmUrl.sh"), desc="open url"),

    #######################################################
    #         DAEMONS KEYBINDINGS CONFIGURATION           #
    #######################################################

    # |                      T-Key                      | #
    # |-------------------------------------------------| #
    # |                 Service killer                  | #
    #
    # kill compositor
    Key([mod, alt], "t", lazy.spawn("pkill picom"), desc="kill picom"),
    #
    # start compositor
    Key([mod, alt, "shift"], "t", lazy.spawn("picom -b -f -c"), desc="start picom"),

    #######################################################
    #           CONFIGURATION FILE KEYBINDINGS            #
    #######################################################
    #
    # |                      C-Key                      | #
    # |-------------------------------------------------| #
    # |             qtile configuration file            | #
    #
    # restart qtile inplace (preserves your layout/session)
    Key([mod, "shift"], "c", lazy.restart(), desc="Restart Qtile"),

    #######################################################
    #   QTILE WINDOW BEHAVIOUR KEYBINDING CONFIGURATION   #
    #######################################################

    # |                      Q-Key                      | #
    # |-------------------------------------------------| #
    # |              Killing things section             | #
    #
    # kill focused window
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    #
    # Qtile exit and reload
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #
    # shut down, restart and locking features mode (chord)
    # create cord

    # |                      Q-Key                      | #
    # |-------------------------------------------------| #
    # |              Killing things section             | #
    #
    # kill focused window
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Full screen"),

    # |                 [H|J|K|L]-Key                   | #
    # |-------------------------------------------------| #
    # |   Window behavior: focus, resize and movement   | #
    #
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Tab", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),
        desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(),
        desc="Grow window up"),
    Key([mod, "control"], "n", lazy.layout.normalize(),
        desc="Reset all window sizes"),

    # Toggle between different layouts as defined below
    Key([mod, alt, "control"], "j", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, alt, "control"], "k", lazy.prev_layout(), desc="Toggle between layouts"),

    # Move between groups
    Key([mod, alt, "control"], "l", lazy.screen.next_group(), desc="Jump to the next group"),
    Key([mod, alt, "control"], "h", lazy.screen.prev_group(), desc="Jump to the previous group"),

    #                      Tab-Key                      | #
    # |-------------------------------------------------| #
    # |       Window behavior: split and unsplit        | #
    #
    #


    # |                  Space-Key                      | #
    # |-------------------------------------------------| #
    # |       Window behavior: split and unsplit        | #
    #
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "space", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    #
    # Toggle floating mode
    Key([mod, "shift"], "space", lazy.window.toggle_floating(),
        desc="Toggle floating mode"),
]

############################
### GROUPS CONFIGURATION ###
############################

__groups = {
    1: Group("",),
    2: Group("",
             matches=[Match(wm_class=["firefox"])],
             layout=''
             ),
    3: Group("",
             matches=[
                 Match(wm_class=["libreoffice-startcenter"])
             ],
             layout=''
             ),
    4: Group("",
             matches=[
                 Match(wm_class=["Spotify"]),
                 Match(wm_class=["vlc"]),
             ],
             layout = '',
             ),
    5: Group("",
             matches=[
                 Match(wm_class=["Emacs"])
             ],
             layout=''
             ),
    6: Group(""),
    7: Group(""),
    8: Group(""),
    9: Group(""),
}

# --List comprehension for groups
#   groups will be filled with oll the group list in __groups
groups = [__groups[i] for i in __groups]

def get_group_key(name):
    return [k for k, g in __groups.items() if g.name == name][0]


# |                  [0-9]-Key                      | #
# |-------------------------------------------------| #
# |    Window behavior: switch/move to workspace    | #

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], str(get_group_key(i.name)), lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], str(get_group_key(i.name)),
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

#############################
### LAYOUTS CONFIGURATION ###
#############################

layouts = [
    layout.Columns(
        name = '',
        border_focus_stack='#E6A0FA',
        border_normal=back,
        border_focus=color_light,
        border_width=2,
        single_border_width=0,
        margin=10,
        single_margin=10,
    ),
    layout.Max(name='',),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(
        name='',
        border_normal=back,
        border_focus=color_light,
        border_width=2,
        single_border_width=0,
        margin=10,
        single_margin=10,
    ),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

#########################
### BAR CONFIGURATION ###
#########################

widget_defaults = dict(
    font='DejaVuSans',
    fontsize=13,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    text='jS',
                    tmt='{}',
                    font='Inconsolata',
                    markup=True
                ),
                widget.CurrentLayout(
                    padding=None,
                ),
                widget.GroupBox(
                    active=active_fg,
                    disable_drag=True,
                    highlight_method='block',
                    block_highlight_text_color=highlight_fg,
                    this_current_screen_border=highlight_bg,
                    rounded=True,
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.KeyboardLayout(
                    configured_keyboards = ['es']
                ),
                widget.Memory(
                    update_interval=1.0,
                    padding=None,
                    format='{MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}'
                ),
                widget.ThermalSensor(
                    threshold=80,
                    update_interval=2
                ),
                widget.Clock(
                    format='%a %d-%m-%y %H:%M %p',
                    padding=None,
                ),
                widget.CheckUpdates(
                    colour_no_updates=no_ups,
                    colour_have_updates=ups,
                    custom_command='checkupdates+aur',
                    display_format='',
                    distro='Arch',
                    execute='xfce4-terminal -e pacman -Syu',
                    no_update_string='',
                    update_interval=60,
                    fontsize=15,
                ),
                 widget.Systray(),
           ],
            23,
            background=back,
            opacity=1,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),    # gitk
    Match(wm_class='maketag'),       # gitk
    Match(wm_class='ssh-askpass'),   # ssh-askpass
    Match(wm_class='MEGAsync'),      # ssh-askpass
    Match(title='branchdialog'),     # gitk
    Match(title='pinentry'),         # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# INFO: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

################
### AUTOEXEC ###
################

os.system('setxkbmap es &')

#############
### HOOKS ###
#############

@hook.subscribe.startup_once
def autostart():
    auto_script = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([auto_script])
