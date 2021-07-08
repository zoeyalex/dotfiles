#!/bin/sh

set -e

SPACE="$(echo `df -lh --output=avail /` | grep -oE "[0-9]{1,3}[a-zA-Z]{1,3}")"
