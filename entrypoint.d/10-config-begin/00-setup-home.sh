#!/bin/bash

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "transmission:x:$(id -u):0:transmission user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

mkdir -p "$(dirname "${TRANSMISSION_CONFIG}")"

ln -s /data/torrents ${TRANSMISSION_HOME}/torrents
ln -s /data/blocklists ${TRANSMISSION_HOME}/blocklists
ln -s /data/resume ${TRANSMISSION_HOME}/resume
