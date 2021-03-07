#!/bin/sh

Installfish(){
	if [ ! -n "$HOME/.config/fish" ]
	then
		mdir -p $HOME/.config/fish
	fi

	echo "[INFO] Copying fish dotfile."
	cp -r fish $HOME/.config/
}
