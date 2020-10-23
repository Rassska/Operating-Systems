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

isInteractive="no"



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

case $1 in "calc")
    if [[ $# == 4 ]]; then
        shift # remove calc
        . ./operations/calc.sh "$isInteractive" "$1" "$2" "$3"
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of calc's arguments must be equal to 3" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            if [[ $isInteractive == "no" ]]; then
                exit -1
            fi
    fi
;; "search")
    if [[ $# == 3 ]]; then
        shift
        . ./operations/search.sh "$isInteractive" "$1" "$2"
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of search's arguments must be equal to 2" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
               cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            if [[ $isInteractive == "no" ]]; then
                exit -1
            fi
    fi
;; "reverse")
    if [[ $# == 3 ]]; then
        shift
        . ./operations/reverse.sh "$isInteractive" "$1" "$2"
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of reverse's arguments must be equal to 2" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            if [[ $isInteractive == "no" ]]; then
                exit -1
            fi
    fi

;; "strlen")
	if [[ $# == 2 ]]; then
		shift
		. ./operations/strlen.sh "$@"
	else
		echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of strlen's arguments must be equal to 1" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            if [[ $isInteractive == "no" ]]; then
                exit -1
            fi
	fi
;; "log")
	if [[ $# == 1 ]]; then
		. ./operations/log.sh "$isInteractive"
	else
		echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of log's arguments must be equal to 0" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            if [[ $isInteractive == "no" ]]; then
                exit -1
            fi
	fi
;; "exit")
	if [[ $# == 2 || $# == 1 ]]; then
    shift
		. ./operations/exit.sh "$isInteractive" $1
	else
		echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of exit's arguments must be equal to 1 or 0" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            if [[ $isInteractive == "no" ]]; then
                exit -1
            fi
	fi
;; "help")
	if [[ $# == 1 ]]; then
		cat help.txt
	else
		echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of help's arguments must be equal to 0" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            if [[ $isInteractive == "no" ]]; then
                exit -1
            fi
	fi
;; "interactive")
	if [[ $# == 1 ]]; then
		. ./operations/interactive.sh
	else
		echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The amount of interactive's arguments must be equal to 0" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more

            fi
            if [[ $isInteractive == "no" ]]; then
                exit -1
            fi
	fi
;;
esac
