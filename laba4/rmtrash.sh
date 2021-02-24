#!/bin/bash

currDate=$(date +'%F_%H-%M-%S');

if !(( $# == 1 )); then
    echo "Wrond amount of args!"
    exit -1
fi

if [[ ! -f $1 ]]; then
    echo "Current file doesn't exist!"
    exit -2
fi

mkdir $HOME/.trash;
ln $1 $HOME/.trash/$currDate



echo "path deleted: $PWD/$1 link createdd: $currDate" >> $HOME/.trash.log

rm $1