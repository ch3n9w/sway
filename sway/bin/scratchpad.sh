#!/bin/sh

kitty --class "scratchpad" &

sleep 0.5
swaymsg move scratchpad
swaymsg scratchpad show
