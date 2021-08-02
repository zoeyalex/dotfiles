#!/bin/sh
#OpenBSD battery status bar script
CHARGING=`apm -m`
if [ $CHARGING = "unknown" ]; then
    BATTERY="charging"
else
    BATTERY="$(apm -l)% ${CHARGING}m "
fi
