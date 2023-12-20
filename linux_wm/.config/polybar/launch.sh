#!/usr/bin/env bash
# https://wiki.archlinux.org/title/Polybar#Running_with_WM

# Terminate already running instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
polybar custom 2>&1 | tee -a /tmp/polybar.log & disown

echo "polybar launched..."
