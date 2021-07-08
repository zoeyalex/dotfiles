#!/bin/sh
#OpenBSD battery status bar script
CHARGING=`apm -m`
if [ $CHARGING = "unknown" ]; then
    BATTERY="charging"
else
    BATTERY="$(apm | grep -oE "[0-9]{1,3}\%") ${CHARGING}m "
fi
