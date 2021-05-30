#!/bin/sh

set -e

MUTE=`pulsemixer --get-mute`
VOLUME_INT="$(echo `pulsemixer --get-volume` | grep -o "\s[0-9][0-9]\?")"

if  (($MUTE == 1)) || (($VOLUME_INT == 0)) ; then
    VOLUME="  0%"
elif (($VOLUME_INT <= 50)); then
    VOLUME=" ${VOLUME_INT}%"
else
    VOLUME=" ${VOLUME_INT}%"
fi
