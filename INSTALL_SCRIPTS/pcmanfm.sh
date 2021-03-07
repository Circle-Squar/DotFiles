#!/bin/sh

Installpcmanfm(){
	if [ ! -n "$HOME/.config/pcmanfm" ]
	then
		mkdir -p $HOME/.config/pcmanfm
	fi

	cp -r pcmanfm $HOME/.config/
}
