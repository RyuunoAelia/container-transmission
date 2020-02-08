#!/bin/bash

cat <<EOF>> $TRANSMISSION_CONFIG
    ,"peer-port": ${TRANSMISSION_PEER_PORT:=51413}
    ,"peer-port-random-on-start": false
    ,"port-forwarding-enabled": ${TRANSMISSION_UPNP:=true}
EOF
