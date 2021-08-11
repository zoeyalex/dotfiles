#!/bin/sh
#OpenBSD battery status bar script
ESTIMATED=`apm -m`
PERCENTAGE=`apm -l`
if [ $ESTIMATED = "unknown" ]; then
    BATTERY="${PERCENTAGE}% charging"
else
    BATTERY="${PERCENTAGE}% ${ESTIMATED}m"
fi
