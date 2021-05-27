#!/bin/bash
WEATHER=" $(curl -s wttr.in/?format=1 | grep -o ".[0-9].*")"
