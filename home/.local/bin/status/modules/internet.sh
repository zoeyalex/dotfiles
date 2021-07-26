#!/bin/sh

set -e

INTERNET=`cat /sys/class/net/e*/operstate`
