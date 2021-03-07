#!/bin/sh

Installrime(){
	case "$Root" in 
		0)
			for inputMethod in fcitx fcitx5 ibus
			do
				if [ -n "$(command -v $inputMethod)" ]
				then
					echo -e "[INFO] Inputmethod found : $inputMethod."
					RimeInstallPath="$HOME/.config/$inputMethod"
				fi
			done
			;;
		1)
			RimeInstallPath="/usr/share"
			;;
	esac

	if [ ! -n "$RimeInstallPath" ]
	then
		echo mkdiring... $RimeInstallPath
		mkdir -p "$RimeInstallPath"
	fi

	echo -e "[INFO] Copying Rime profile."
	cp -r "./rime-data" "$RimeInstallPath/"
}
