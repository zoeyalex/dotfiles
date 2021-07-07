#!/bin/sh
#OpenBSD battery status bar script
CHARGING=`apm -m`
if [ $CHARGING = "unknown" ]; then
    BATTERY="charging"
else
    BATTERY="$(apm | grep -Eo "[0-9][0-9]?[0-9]?\%") ${CHARGING}m "
fi
