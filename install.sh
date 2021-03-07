#!/bin/sh
for file in $(pwd)/INSTALL_SCRIPTS/*
do
	source $file
done

# Init
#================================================================

forcemode=0
for i in $*
do
	if [[ $i == 'f' || $i == '-f' ]]
	then
		forcemode=1
	fi
done

Root=$(ISroot)
list='alacritty rime krita fish obs gtk blender nvim'

# Install
#################################################################
for i in $list 
do
	echo "[INFO] executing $i."
	checkInstall
	if [ $Install -eq 1 ]
	then
		Install$i
	fi
	echo 
done

# Not install
##################################################################

echo 
for i in $NotInstallList
do
	echo "[INFO] Can't found $i."
done
echo "[INFO] You may need to install :$NotInstallList"
