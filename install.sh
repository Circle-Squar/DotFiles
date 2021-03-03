#!/bin/sh

root=false

function backup() {
	if [ -n "$1/nvim/" ]
	then
		echo "[INFO] BackUp nvim dotfile to $1/nvim.bak"
		mv $1/nvim $1/nvim.bak
		mkdir $1/nvim
	fi

	if [ -n "$1/alacritty/" ]
	then
		echo "[INFO] BackUp alacritty dotfile to $1/alacritty.bak"
		mv $1/alacritty $1/alacritty.bak
		mkdir $1/alacritty
	fi

	if [ -n "$2" ]
	then
		echo "[INFO] BackUp rime dotfile to $2.bak"
		mv $2 $2.bak
		mkdir $2
	fi
}

function CopyFile_MainFlore() {
	echo "[INFO] Installing alacritty dotfile."
	cp -r ./alacritty $1
	echo "[INFO] Installing nvim dotfile."
	cp -r ./nvim $1
}

function CopyFile_Rime() {
	Con='y'
	if [ $2 -eq 1 ]
	then
		echo "[WARNING] Rime dotfile existed: $1"
		read -p "[INFO] Continue (y/n, default = y): " rd
	fi	

	if [ -z $rd ]
	then
		Con='y'
	else
		Con=$rd
	fi
	
	if [[ $Con == 'y' || $Con == 'Y' ]]
	then
		echo "[INFO] Continued!"
		mkdir $1
		cp -r ./rime-data/* $1
	else
		echo "[INFO] Skip!"
	fi
}

function InstallVim() {
	nvim -c "PlugInstall" ./nviminstall.info
	nvim -c "CocInstall coc-clangd coc-cmake coc-emmet coc-git coc-highlight coc-jedi coc-json coc-python coc-sh coc-snippets coc-vimlsp coc-yaml coc-syntax coc-pairs" ./nviminstall.info
}

function IsRoot() {
	userList=$(env | grep USER | cut -d "=" -f 2)
	Root=0
	for i in $userList
	do
		if [ $i == "root" ]
		then
			Root=1
		fi
	done
	echo $Root
	return $?
}

function main() {

	# Init
	#==========================================
	root=$(IsRoot)
	Rime=0
	if [ $root -eq 1 ]
	then
		# Root
		#==========================================
		rimePath="/usr/share/rime-data/"
		if [ ! -n "/usr/share/rime-data/" ]
		then
			mkdir /usr/share
			mkdir /usr/share/rime-data
		else
			Rime=1
		fi
	else
		# Nan Root
		#==========================================
		if [ -x "$(command -v fcitx)" ]
		then
			echo "[Info] fcitx installed."
			if [ ! -n "~/.config/fcitx/" ]
			then
				mkdir ~/.config/fcitx
			else
				Rime=1
			fi
			rimePath="~/.config/fcitx/rime/"

		else if [ -x "$(command -v ibus)" ]
		then
			echo "[Info] ibus installed."
			if [ ! -n "~/.config/ibus/" ]
			then
				mkdir ~/.config/ibus
			else
				Rime=1
			fi
			rimePath="~/.config/ibus/rime/"

		else if [ -x "$(command -v fcitx5)" ]
		then
			echo "[Info] fcitx5 installed."
			if [ ! -n "~/.config/fcitx5/" ]
			then
				mkdir ~/.config/fcitx5
			else
				Rime=1
			fi
			rimePath="~/.config/fcitx5/rime/"

		fi
		fi
		fi
	fi

	configPath="~/.config/"

	echo "[INFO] Rime dotfile will install to : $rimePath"
	echo "[INFO] nvim dotfile will install to : $configPath""nvim/"
	echo "[INFO] alacritty dotfile will install to : $configPath""alacritty/"

	Cont=""

	while [ ! $Cont ]
	do
		read -p "[INFO] Continue to install (default: y): " Cont
	done

	if [[ $Cont == 'Y' || $Cont == 'y' ]]
	then
		# Back up File
		#==========================================
		backup $configPath $rimePath


		# Copy File
		#==========================================

		CopyFile_MainFlore "~/.config/"
		CopyFile_Rime $rimePath $Rime
		InstallVim

		if [ ! -x "$(command -v nvim)" ]
		then
			echo "[WARNING] nvim hasn't install."
		fi

		if [ ! -x "$(command -v alacritty)" ]
		then
			echo "[WARNING] alacritty hasn't install."
		fi

		if [ ! -x "$(commmand -v fcitx fcitx5 ibus)"]
		then
			echo "[WARNING] Can't found fcitx/fcitx5/ibus."
		fi

		if [ ! -x "$(command -v rime-deployer)" ]
		then
			echo "[WARNING] Rime hasn't install."
		fi

	else
		echo "[INFO] Cancled."

	fi
	
}

main
