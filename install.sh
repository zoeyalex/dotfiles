#!/bin/sh
set -e
script_path=$(dirname $(readlink -f $0))
cp $script_path/".bashrc" $script_path/".vimrc" ~
