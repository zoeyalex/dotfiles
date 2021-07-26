#!/bin/sh

set -x

MUTE=`pulsemixer --get-mute`
VOLUME_INT="$(echo `pulsemixer --get-volume` | grep -oE "\s[0-9]{1,3}")"

if  [ $MUTE -eq 1 ] -o [ $VOLUME_INT -eq 0 ] ; then
    VOLUME=" 0%"
else
    VOLUME="${VOLUME_INT}%"
fi
