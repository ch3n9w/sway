#!/bin/sh

kitty --class "scratchpad" &

sleep 0.2
swaymsg '[app_id="scratchpad"]' 'split vertical,layout tabbed,focus parent'
swaymsg move scratchpad
swaymsg scratchpad show
