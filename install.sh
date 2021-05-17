#!/bin/sh

set -e

script_path=$(dirname $(readlink -f $0))

cd $script_path/home
for file in $(find -type f); do
    if ! diff -q $file ~/$file >/dev/null; then
        echo -e '\n\033[0;33m'$file differs
        cp -iv $file ~/$file
    fi
done
