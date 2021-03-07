#!/bin/sh

Installblender(){
	if [ ! -n "$HOME/.config" ]
	then
		mkdir -p $HOME/.config
	fi

	echo [INFO] Copying Blender Profiles.
	cp -r blender $HOME/.config/
}
