#!/bin/bash

IFS=$'\n'

if !(( $# == 1 )); then
    echo "Wrond amount of args!"
    exit -1
else
    if [[ $1 == *"/"* ]]; then
        echo "Only file name, not the path"
        exit -2
    fi
fi


[ -f $HOME/.trash.log ] || { echo "trash.log doesn't exist"; exit -1; };
[ -d "$HOME/.trash" ] || { echo ".trash doesn't exist"; exit -3; };


for currFileToRef in $(cat $HOME/.trash.log)
do
    givenFilePath=$(echo $currFileToRef | awk '{ print $3 }')
    

    if [[ $1 == "$(echo $givenFilePath | awk -F/ '{ print $NF }')" ]]; then
        
        
        echo "Path: $givenFilePath"
        read -p "(y/n)?" currStatus
        case $currStatus in
        [y]* )
            receivingFile=$(echo $currFileToRef | awk '{ print $6 }')
            currDiectory=$(echo $givenFilePath | awk 'BEGIN{ FS=OFS="/" }{ NF--; print }')
            
            if [ -d $currDiectory ]; then
                if [ -f $givenFilePath ]; then
                    read -p "This file exists, try another: " anotherFile
                    ln $HOME/.trash/$receivingFile $currDiectory/$anotherFile
                    echo "$receivingFile was recovered in $currDiectory!"

                else
                    ln $HOME/.trash/$receivingFile $givenFilePath
                    echo "$receivingFile was recovered in $currDiectory!"
                fi

            else
                if [ -f $HOME/$1 ]; then
                    read -p "This file exists, try another: " anotherFile
                    ln $HOME/.trash/$receivingFile $HOME/$anotherFile
                    echo "$receivingFile was recovered in HOME directory!"

                else
                    ln $HOME/.trash/$receivingFile $HOME/$1
                    echo "$receivingFile was recovered in HOME directory!"
                fi

            fi

        grep -v "$receivingFile" $HOME/.trash.log > kek
        mv kek /root/.trash.log
        rm -rf $HOME/.trash/$receivingFile
        ;;

        [n]* )
            ;;

        * )
            echo "unavailable command! Try again!"
            ;;
        esac
    fi
done
