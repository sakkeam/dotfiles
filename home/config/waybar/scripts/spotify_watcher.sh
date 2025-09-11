#!/bin/sh

signal=2

spotify_player() {
  local player_name=spotify
  playerctl --player="$player_name" "$@"
}

spotify_player --format='{{status}} {{album}} {{artist}} {{title}}' --follow metadata | \
  while read line; do
    pkill \
      -SIGRTMIN+"$signal" \
      --exact \
      waybar
  done
