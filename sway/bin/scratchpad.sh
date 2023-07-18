#!/bin/sh

alacritty --class "scratchpad" &

sleep 0.5
swaymsg move scratchpad
swaymsg scratchpad show
