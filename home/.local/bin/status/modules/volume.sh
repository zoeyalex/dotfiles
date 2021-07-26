#!/bin/sh

set -x

MUTE=`pactl list sinks | awk '/Mute/ { print $2 }'`
if  [ $MUTE = "yes" ]; then
    VOLUME=" 0%"
else
    VOLUME=" $(amixer sget Master | grep -Eom1 "[0-9]{1,3}%")"
fi
