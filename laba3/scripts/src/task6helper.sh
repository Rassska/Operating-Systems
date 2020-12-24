#!/bin/bash

echo $$ > .pid

kek=1
oper="*"


trap 'usr1' USR1
trap 'term' SIGTERM
trap 'usr2' USR2

term()
{
    oper="TERM"
}
usr1()
{
    oper="+"
}
usr2()
{
    oper="*"
}

for (( i=1; i <= 10;))
do
    case $oper in
    "+")
        let kek=$kek+2
        echo "kek is equal to $kek"
    ;;

    "*")
        let kek=$kek*2
        echo "kek is equal to $kek"
    ;;

    TERM)
        echo "Exited by signal"
        exit
    ;;

    esac
    sleep 1
done

