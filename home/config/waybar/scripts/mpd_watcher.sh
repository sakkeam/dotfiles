#!/bin/sh

signal=1

while :; do
  result="$(mpc idle player)"
  pkill \
    -SIGRTMIN+"$signal" \
    --exact \
    waybar
done
