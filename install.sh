#!/bin/sh

cd "$(dirname "${0}")"

(
  cd home \
    && find \
    -mindepth 1 \
    -type f \
    -printf '%P\n' \
    | xargs --max-lines=1 dirname \
    | xargs --replace={} mkdir \
    --parents \
    --verbose \
    "${HOME}/{}" \
    && find \
    -mindepth 1 \
    -type f \
    -printf '%P\n' \
    | xargs --replace={} ln \
    --force \
    --symbolic \
    --verbose \
    "${PWD}/{}" \
    "${HOME}/{}"
)
