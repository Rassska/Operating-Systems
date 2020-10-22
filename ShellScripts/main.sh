#!/bin/bash

# calc.sh
# exit.sh
# help.sh
# interactive.sh
# log.sh
# reverse.sh
# search.sh
# strlen.sh
# main.sh
function check () {
    if [[ $1 != "calc" 
       && $1 != "exit" 
       && $1 != "help" 
       && $1 != "interactive" 
       && $1 != "log" 
       && $1 != "reverse" 
       && $1 != "search" 
       && $1 != "strlen" ]]; then

        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "There is no \"$1\" function." >&2 
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            exit -1
    fi
}

check $1

case $1 in
"calc")
    if [ $# == 4 ]; then
        shift
        . ./operations/calc.sh "$1" "$2" "$3"
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of calc's arguments must be equal to 4" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            exit -1
    fi
;;
"search")
    if [ $# == 3 ]; then
        shift
        . ./operations/search.sh "$1" "$2"
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of search's arguments must be equal to 3" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/laba1/help.txt | more
            fi
            exit -1
    fi
esac