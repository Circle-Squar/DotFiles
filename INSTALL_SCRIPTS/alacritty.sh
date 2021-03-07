#!/bin/sh

Installalacritty(){
	if [ ! -n "~/.config/alacritty/" ]
	then
		mkdir -e ~/.config/alacritty
	fi

	echo "[INFO] Copying alacritty dotfile."
	cp -r alacritty/* ~/.config/alacritty/
}
