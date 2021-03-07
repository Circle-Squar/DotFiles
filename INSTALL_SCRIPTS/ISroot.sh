#!/bin/sh

ISroot(){
	if [ $(whoami) == 'root' ]
	then
		Isroot=1
	else
		Isroot=0
	fi
	echo $Isroot
	return $Isroot
}
