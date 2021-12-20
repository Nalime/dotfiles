#!/usr/bin/env bash
# https://wiki.archlinux.org/title/Polybar#Running_with_WM

# Terminate already running instances
killall -q picom

# Launch picom with given arguments
picom "$@" &

echo "picom launched..."
