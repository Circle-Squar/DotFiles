#!/bin/sh

checkInstall(){
	case "$i" in 
	# Rime
	####################################
	rime)
		if [[ -n "$(command -v rime_patch)" || $forcemode -eq 1 ]]
		then
			if [[ $forcemode -eq 1 && ! -n "$(command -v rime_patch)" ]]
			then
				echo  "[WARNING] $i not installed, but dotfile will installed!(forcemode true)"
			else
				echo  "[INFO] $i Found!"
			fi
			Install=1
		else
			echo "[WARNING] $i not installed! Dot file will not install.(Forcemode : -f)"
			Install=0
			NotInstallList="$NotInstallList $i"
		fi
		;;

	gtk)
		if [[ -n "$(command -v gtk3-demo)" || $forcemode -eq 1 ]]
		then
			if [[ $forcemode -eq 1 && ! -n "$(command -v gtk3-demo)" ]]
			then
				echo  "[WARNING] $i not installed, but dotfile will installed!(forcemode true)"
			else
				echo  "[INFO] $i Found!"
			fi
			Install=1
		else
			echo "[WARNING] $i not installed! Dot file will not install.(Forcemode : -f)"
			Install=0
			NotInstallList="$NotInstallList $i"
		fi
		;;

	# Default
	####################################
	*)
		if [[ -n "$(command -v $i)" || $forcemode -eq 1 ]]
		then
			if [[ $forcemode -eq 1 && ! -n "$(command -v $i)" ]]
			then
				echo  "[WARNING] $i not installed, but dotfile will installed!(forcemode true)"
			else
				echo  "[INFO] $i Found!"
			fi
			Install=1
		else
			echo "[WARNING] $i not installed! Dot file will not install.(Forcemode : -f)"
			Install=0
			NotInstallList="$NotInstallList $i"
		fi
	esac
}
