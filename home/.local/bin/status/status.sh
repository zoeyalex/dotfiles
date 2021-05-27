#!/bin/sh

set -x

SCRIPT_PATH=$(dirname $(readlink -f $0))

. $SCRIPT_PATH/modules/volume.sh
. $SCRIPT_PATH/modules/weather.sh

TIME=`date +"%A %d-%m-%Y %R"`

xsetroot -name "${VOLUME} ${WTR} ${TIME}"
