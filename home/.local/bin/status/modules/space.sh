#!/bin/sh

set -e

SPACE="$(echo `df -lh --output=avail /` | grep -o "[0-9][0-9]\?[0-9]\?[0-9]\?[a-zA-Z][a-zA-Z]\?[a-zA-Z]\?")"
