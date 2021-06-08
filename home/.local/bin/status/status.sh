#!/bin/sh

set -ex

SCRIPT_PATH=$(dirname $(readlink -f $0))
TIME="$(date +"%a %d/%m %R")"
SEPARATOR="│"

. $SCRIPT_PATH/modules/volume.sh
. $SCRIPT_PATH/modules/weather.sh


xsetroot -name "${VOLUME}  ${WEATHER}  ${TIME}"
