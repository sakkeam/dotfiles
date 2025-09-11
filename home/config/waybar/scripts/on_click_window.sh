#!/bin/sh

address="$1"
button="$2"

if [ "$button" -eq 1 ]; then
  # left click
  hyprctl keyword cursor:no_warps true
  hyprctl dispatch focuswindow "address:$address"
  hyprctl keyword cursor:no_warps false
elif [ "$button" -eq 2 ]; then
  # middle click
  hyprctl dispatch closewindow "address:$address"
fi
