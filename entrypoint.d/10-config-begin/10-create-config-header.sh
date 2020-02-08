#!/bin/bash


if [ -z "${TRANSMISSION_RPC_HOST_WHITELIST}" ]; then
  TRANSMISSION_WHITELIST_RCP=false
else
  TRANSMISSION_WHITELIST_RCP=true
fi

cat <<EOF >> $TRANSMISSION_CONFIG
{
  "rpc-enabled": true,
  "rpc-whitelist": "${TRANSMISSION_RPC_WHITELIST:=127.0.0.1}",
  "rpc-whitelist-enabled": true,
  "download-dir": "/data/download",
  "incomplete-dir": "/data/incomplete",
  "incomplete-dir-enabled": "${TRANSMISSION_INCOMPLETE:=false}",
  "preallocation": ${TRANSMISSION_PREALLOCATION:=1},
  "rename-partial-files": ${TRANSMISSION_RENAME_PARTIAL:=true},
  "start-added-torrents": ${TRANSMISSION_ADD_START:=true},
  "trash-original-torrent-files": true,
  "umask": ${TRAMISSION_UMASK:=12},
  "watch-dir": "/data/torrent-watch",
  "rpc-host-whitelist": "${TRANSMISSION_RPC_HOST_WHITELIST}",
  "rpc-host-whitelist-enabled": ${TRANSMISSION_WHITELIST_RCP},
  "watch-dir-enabled": true
EOF
