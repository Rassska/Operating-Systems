#!/bin/bash

for (( i=1; i <= 10;))
do

    read string
    case $string in
    "+")
        kill -USR1 $(cat .pid)
    ;;

    "*")
        kill -USR2 $(cat .pid)
    ;;

    TERM)
        kill -SIGTERM $(cat .pid)
        exit
    ;;

    *)
        continue
    ;;
    esac
    
done