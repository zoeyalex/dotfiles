#!/bin/sh

set -x

volume_str=`pamixer --get-volume-human`
volume_int=$(echo ${volume_str} | tr -d -c 0-9)
time=`date +"%A %d-%m-%Y %R"`

if  grep -q "muted" <<< $volume_str || (($volume_int == 0)); then
    xsetroot -name " 0%  ${time}"
elif (($volume_int <= 50)); then
    xsetroot -name " ${volume_str}  ${time}"
else
    xsetroot -name " ${volume_str}  ${time}"
fi
