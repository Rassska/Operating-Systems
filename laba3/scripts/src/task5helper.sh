#!/bin/bash

res=1
mod="*"

(tail -f pipe) |
for (( i=1; i <= 10;))
do
    read string;

    case $string in 
    QUIT)
        echo "See you, man!"
        killall tail
        killall task5helper.sh
        exit
    ;;

    "+")
        mod="+"
    ;;

    "*")
        mod="*"
    ;;

    [0-9]*)
        
        if [[ $mod == "+" ]]; then
            let res=$res+$string
            echo "Result was changed to $res"
        else
            let res=$res*$string
            echo "Result was changed to $res"
        fi
    ;;

    *)
        echo "Wrong operation"
        killall tail
        killall task5helper.sh
        exit
    ;;

    esac
done