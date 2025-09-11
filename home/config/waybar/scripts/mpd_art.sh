#!/bin/sh

path=/tmp/mpd-art.jpg

clean() {
  rm --force "$path"
}

mpc_status="$(mpc status %state%)"
if [ "$mpc_status" == "playing" ]; then
  ffmpeg \
    -loglevel quiet \
    -i "$HOME/Music/$(mpc --format=%file% current)" \
    -y \
    -an \
    -c:v copy \
    -update 1 \
    "$path"
  printf '%s\n' "$path"
elif [  "$mpc_status" == "paused" ]; then
  printf '%s\n' "$path"
elif [  "$mpc_status" == "stopped" ]; then
  clean
fi
