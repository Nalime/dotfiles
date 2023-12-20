#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f ~/.xprofile ] && . ~/.xprofile

# For setting DPI
xrdb -merge ~/.Xresources

# Make Qt5 apps use GTK configurations
export XDG_CURRENT_DESKTOP=GNOME

# Key repeat delay & rate
xset r rate 350 32

# Run i3wm
i3
