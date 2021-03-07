#!/bin/sh

Installkrita(){
	if [ ! -n "$HOME/.local/share/krita/" ]
	then
		mkdir -p $HOME/.local/share/krita
	fi

	echo "[INFO] Copying Krita profiles"
	cp -r krita/Profile $HOME/.local/share/
	cp -r krita/Dotfile/* $HOME/.config
}
