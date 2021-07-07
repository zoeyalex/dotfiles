#!/bin/sh

set -ex

SCRIPT_PATH=$(dirname $(readlink -f $0))
TIME="$(date +"%a %d/%m %R")"
#SEPARATOR="│"

. $SCRIPT_PATH/modules/volume.sh
. $SCRIPT_PATH/modules/weather.sh
. $SCRIPT_PATH/modules/space.sh


xsetroot -name "${SPACE} ${VOLUME}  ${WEATHER}  ${TIME}"
