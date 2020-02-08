#!/bin/bash

cat <<EOF>> $TRANSMISSION_CONFIG
    ,"peer-id-ttl-hours": ${TRANSMISSION_PEER_TTL:=6}
    ,"peer-limit-global": ${TRANSMISSION_PEER_GLOBAL_LIMIT:=240}
    ,"peer-limit-per-torrent": ${TRANSMISSION_PEER_LIMIT:=60}
    ,"peer-socket-tos": "${TRANSMISSION_TOS:=default}"
EOF
