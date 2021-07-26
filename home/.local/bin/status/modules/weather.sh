#!/bin/sh

set -x

WEATHER=$(
if curl wttr.in/?format="%t" 2>/dev/null; then
    :
else
    echo N/A
fi
)
