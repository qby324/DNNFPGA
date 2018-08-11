#! /bin/bash

function vcheck() {
    local vname=$1
    local val=$2

    if [ "$val" != "" ]; then
	echo $vname = $val
    else
	echo Not defined : $vname
	exit
    fi
}


