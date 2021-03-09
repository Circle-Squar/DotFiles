#!/bin/sh

EnvCheck(){
	echo -e "[..:: Enviroment Check ::..]"
	EnvItems="wget git sh" 
	ErrorList=""
	Error=0
	for Items in $EnvItems
	do
		echo -e "[INFO] Checking $Items ."
		if [ -n "$(command -v $Items)" ]
		then
			echo -e "[INFO] $Items founded."
		else
			echo -e "[ERROR] $Items not founded in path !"
			Error=1
			ErrorList="$ErrorList $Items "
		fi
	done

	if [ $Error -eq 1 ]
	then
		echo -e "[ERROR] Error in check env."
		echo -e "[ERROR] Failed founded \" $ErrorList \" "
		exit -1
	else
		echo -e "[INFO] All env installed correctly.\n"
	fi
}
