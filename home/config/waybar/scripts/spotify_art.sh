#!/bin/sh

file=/tmp/spotify_art.jpg

clean() {
  rm --force "$file"
}

spotify_player() {
  local player_name=spotify
  playerctl --player="$player_name" "$@"
}

status="$(spotify_player status)"
if [ "$status" == "Playing" ]; then
  art_url="$(spotify_player metadata mpris:artUrl)"
  if [ -n "$art_url" ]; then
    printf '%s\n' "$file"
    curl --output "$file" --silent "$art_url" &
  fi
elif [ "$status" == "Paused" ]; then
  printf '%s\n' "$file"
elif [ "$status" == "" ]; then
  # "No players found"
  clean
  printf '\n'
fi
