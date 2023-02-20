#!/bin/sh

# kitty --class "scratchpad" &
alacritty --class "scratchpad" &

sleep 0.5
swaymsg '[app_id="scratchpad"]' 'split vertical,layout tabbed,focus parent'
swaymsg move scratchpad
swaymsg scratchpad show
