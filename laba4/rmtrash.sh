#!/bin/bash

if !(( $# == 1 )); then
    echo "Wrond amount of args!"
    exit -1
fi

if [[ ! -f $1 ]]; then
    echo "Current file doesn't exist!"
    exit -2
fi

mkdir $HOME/.trash;
ln $1 $HOME/.trash/$RANDOM

# vim .trash.log
# rm -rf .trash.log
# rm $1

echo "deleted path: $PWD/$1 created link: $RANDOM" >> $HOME/.trash.log
