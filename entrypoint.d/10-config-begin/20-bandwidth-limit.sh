if [ -z "${TRANSMISSION_BW_LIMIT_UP}" ]; then
  TRANSMISSION_LIMIT_UP=false
else
  TRANSMISSION_LIMIT_UP=true
fi

if [ -z "${TRANSMISSION_BW_LIMIT_DOWN}" ]; then
  TRANSMISSION_LIMIT_DOWN=false
else
  TRANSMISSION_LIMIT_DOWN=true
fi

cat <<EOF >> $TRANSMISSION_CONFIG
  ,"speed-limit-up-enabled" : ${TRANSMISSION_LIMIT_UP}
  ,"speed-limit-up" : ${TRANSMISSION_BW_LIMIT_UP:=100}
  ,"speed-limit-down-enabled" : ${TRANSMISSION_LIMIT_DOWN}
  ,"speed-limit-down" : ${TRANSMISSION_BW_LIMIT_DOWN:=100}
  ,"upload-slots-per-torrent": ${TRANSMISSION_LIMIT_SLOTS:=14}
EOF
