#!/bin/sh
set -e
script_path=$(dirname $(readlink -f $0))
if  diff -bq ~/.bashrc $script_path/.bashrc | grep -q "differ" ; then
	echo -e "\n\033[0;33m.bashrc differs"
	cp -iv $script_path/.bashrc ~
fi
if  diff -bq ~/.vimrc $script_path/.vimrc | grep -q "differ" ; then
	echo -e "\n\033[0;33m.vimrc differs"
	cp -iv $script_path/.vimrc ~
fi
if diff -bq ~/.xinitrc $script_path/.xinitrc | grep -q "differ" ; then
	echo -e "\n\033[0;33m.xinitrc differs"
	cp -iv $script_path/.xinitrc ~
fi
if diff -bq ~/.config/picom.conf $script_path/.config/picom.conf | grep -q "differ" ; then
	echo -e "\n\033[0;33mpicom.conf differs"
	cp -iv $script_path/.config/picom.conf ~/.config
fi
if diff -bq ~/.config/dunst/dunstrc $script_path/.config/dunst/dunstrc | grep -q "differ" ; then
	echo -e "\n\033[0;33dunstrc differs"
	cp -iv $script_path/.config/dunst/dunstrc ~/.config/dunst/dunstrc
fi
