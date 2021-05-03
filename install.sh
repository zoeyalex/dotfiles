#!/bin/sh
set -e
script_path=$(dirname $(readlink -f $0))
if  diff -bq ~/.bashrc $script_path/.bashrc | grep -q "differ" ; then
	echo -e "\n\033[0;33m.bashrc differs"
	cp -iv $script_path/.bashrc ~
fi
if  diff -bq ~/.vimrc $script_path/.vimrc | grep -q "differ" ; then
	echo -e "\n\033[0;32m.vimrc differs"
	cp -iv $script_path/.vimrc ~
fi
if diff -bq ~/.xinitrc $script_path/.xinitrc | grep -q "differ" ; then
	echo -e "\n\033[0;31m.xinitrc differs"
	cp -v $script_path/.xinitrc ~
fi
