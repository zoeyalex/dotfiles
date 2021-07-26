#!/bin/sh

set -x

SCRIPT_PATH=$(dirname $(readlink -f $0))
TIME="$(date +"%a %d/%m %R")"
#SEPARATOR="│"


ping -c1 -q google.com &>/dev/null
if (($? == 0)); then
    . $SCRIPT_PATH/modules/weather.sh
else
    WEATHER="N/A"
fi

. $SCRIPT_PATH/modules/volume.sh
. $SCRIPT_PATH/modules/space.sh
. $SCRIPT_PATH/modules/internet.sh

xsetroot -name "${INTERNET}  ${SPACE} ${VOLUME}  ${WEATHER}  ${TIME}"
