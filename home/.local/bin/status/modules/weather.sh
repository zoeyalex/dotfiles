#!/bin/bash
#WEATHER="$(curl -s wttr.in/?format=1 | grep -o ".[0-9].*")"
WEATHER=`curl wttr.in/?format="%t"`
if (("${#WEATHER}" == 0)) ; then
    WEATHER="N/A"
elif (("${#WEATHER}" > 5)) ; then
    WEATHER="srv down"
fi
