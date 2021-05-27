#!/bin/sh
#
set -e

. ./.local/bin/volume.sh
. ./.local/bin/weather.sh

TIME=`date +"%A %d-%m-%Y %R"`

xsetroot -name "${VOLUME} ${WTR} ${TIME}"
