#!/bin/sh

set -e

VOLUME_STR=`pamixer --get-volume-human`
VOLUME_INT=$(echo ${VOLUME_STR} | tr -d -c 0-9)

if  grep -q "muted" <<< $VOLUME_STR || (($VOLUME_INT == 0)); then
    VOLUME="  0%"
elif (($VOLUME_INT <= 50)); then
    VOLUME="  ${VOLUME_STR}"
else
    VOLUME="  ${VOLUME_STR}"
fi
