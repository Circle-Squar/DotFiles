#!/bin/sh

Installgtk(){
	if [ ! -n "$HOME/.config" ]
	then
		mkdir -p $HOME/.config
	fi

	echo "[INFO] Copying GTK3.0 files"
	cp -r gtk/gtk-3.0 $HOME/.config/ 
}
