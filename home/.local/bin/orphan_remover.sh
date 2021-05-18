#!/bin/sh
set -e
pacman -Qtdq | sudo pacman -Rns -
