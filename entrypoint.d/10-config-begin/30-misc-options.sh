#!/bin/bash

if [ -z "${TRANSMISSION_DONE_SCRIPT_FILENAME}" ]; then
  TRANSMISSION_DONE=false
else
  TRANSMISSION_DONE=true
fi

cat <<EOF >> $TRANSMISSION_CONFIG
    ,"cache-size-mb": ${TRANSMISSION_CACHE:=4}
    ,"dht-enabled": ${TRANSMISSION_DHT:=true}
    ,"encryption": ${TRANSMISSION_ENCRYPTION:=1}
    ,"lazy-bitfield-enabled": ${TRANSMISSION_LAZY_BITFIELD:=true}
    ,"lpd-enabled": ${TRANSMISSION_LDP:=false}
    ,"message-level": ${TRANSMISSION_MESSAGE:=2}
    ,"pex-enabled": ${TRANSMISSION_PEX_ENABLED:=true}
    ,"prefetch-enabled": ${TRANSMISSION_PREFETCH:=true}
    ,"scrape-paused-torrents-enabled": ${TRANSMISSION_SCRAP_PAUSED:=true}
    ,"script-torrent-done-enabled": ${TRANSMISSION_DONE}
    ,"script-torrent-done-filename": "${TRANSMISSION_DONE_SCRIPT_FILENAME}"
    ,"utp-enabled": ${TRANSMISSION_UTP_ENABLED:=true}
EOF
