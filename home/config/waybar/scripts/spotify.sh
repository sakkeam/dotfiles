#!/bin/sh

spotify_player() {
  local player_name=spotify
  playerctl --player="$player_name" "$@"
}

build_text() {
  local album="$(spotify_player metadata xesam:album)"
  local artist="$(spotify_player metadata xesam:artist)"
  local title="$(spotify_player metadata xesam:title)"

  printf '%s\n' "$title - $artist\\n$album"
}

status="$(playerctl --player=spotify status)"
if [ "$status" == "Playing" ]; then
  printf '{"text":"%s","class":"playing"}\n' "$(build_text)"
elif [ "$status" == "Paused" ]; then
  printf '{"text":"%s","class":"paused"}\n' "$(build_text)"
elif [ "$status" == "No players found" ]; then
  printf '{"text":"","class":"stopped"}\n'
fi
