#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
# shellcheck source=.xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# For setting DPI
xrdb -merge ~/.Xresources

export GTK_THEME=Adwaita-dark

# Run i3wm
i3
