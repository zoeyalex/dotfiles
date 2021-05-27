#!/bin/sh

set -x

SCRIPT_PATH=$(dirname $(readlink -f $0))
TIME=" $(date +"%a %d/%m %R")"
SEPARATOR="│"

. $SCRIPT_PATH/modules/volume.sh
. $SCRIPT_PATH/modules/weather.sh


xsetroot -name "${VOLUME} ${SEPARATOR} ${WEATHER} ${SEPARATOR} ${TIME}"
