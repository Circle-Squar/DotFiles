#!/bin/sh

Installobs(){
	if [ ! -n "$HOME/.config/obs-studio/basic/profiles" ]
	then
		mkdir -p $HOME/.config/obs-studio/basic/profiles
		mkdir -p $HOME/.config/obs-studio/basic/scenes
	fi

	echo "[INFO] Copying obs profile."
	cp -r obs/Circle_linux_K760E $HOME/.config/obs-studio/basic/profiles/
}
