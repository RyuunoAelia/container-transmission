#!/bin/bash

set -ex

export HOME=/tmp/transmission
export TRANSMISSION_HOME=$HOME/.config/transmission-daemon
export TRANSMISSION_CONFIG=$TRANSMISSION_HOME/settings.json

find /entrypoint.d -type f | sort -n |
while read f; do
  case "$f" in
    *.sh) echo "$0: running \"$f\""; source "$f" ;;
    *) echo "$0: ignoring $f" ;;
  esac
  echo
done

args="$@"
exec bash -c "${args}"
