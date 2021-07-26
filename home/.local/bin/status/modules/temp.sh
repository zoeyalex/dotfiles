#!/bin/sh
#OpenBSD cpu temp status bar script
TEMP="$(sysctl hw.sensors.cpu0 | grep -Eo "[0-9]{1,3}\.[0-9][0-9]")°C"
