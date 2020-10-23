#!/bin/bash

isInteractive="yes"

menu () {
echo -e "List of available commands:\e[0m"
echo -e "\e[1;31mPlease enter the char or the name of the command\e[0m"
echo -e "\e[1;33ma. calc"
echo -e "b. search"
echo -e "c. reverse"
echo -e "d. strlen"
echo -e "e. log"
echo -e "f. exit"
echo -e "g. help"
echo -e "h.interactive\e[0m"
echo -e "\e[1;31mPress x to quit.\e[0m"
}

getBug () {
	echo -ne "\e[1;41m Error: \e[0m" >&2
    echo -ne "There is no access!" >&2
}

calc () {
    
    if [[ -e ./operations/calc.sh ]]; then
        echo -e "\e[1;33mEnter 3 arguments:"
        echo -e "1. sum / sub / mul /div"
        echo -e "Both of the args must be equal to integer values"
        echo -e "operation arg1 arg2\e[0m"
        read operation arg1 arg2
        . ./operations/calc.sh $isInteractive $operation $arg1 $arg2
    else
        getBug
    fi
}

search () {
    if [[ -e ./operations/search.sh ]]; then
        echo -e "\e[1;33mEnter 2 arguments:"
        echo -e "1. directiry name"
        echo -e "2. regular expression you want to find"
        echo -e "directory expression\e[0m"
        read dir expr
        . ./operations/search.sh $isInteractive $dir $expr
    else
        getBug
fi
}

reverse () {
    if [[ -e ./operations/reverse.sh ]]; then
        echo -e "\e[1;33mEnter 2 arguments:"
        echo -e "1. input file (preferably with text in it)))"
        echo -e "2. output file (where to reverse the text)"
        echo -e "input output\e[0m"
        read in out
        . ./operations/reverse.sh $isInteractive $in $out
    else
        getBug
    fi
}

strlen () {
    if [[ -e ./operations/strlen.sh ]]; then
        echo -e "\e[1;33mEnter 1 argument:"
        echo -e "1. 'string'\e[0m"
        read str
        . ./operations/strlen.sh $isInteractive $str
    else
        getBug
    fi
}

log () {
    if [[ -e /home/rasul/dev/OperatingSystems/ShellScripts/X.log ]]; then
        . ./operations/log.sh $isInteractive
    else
        getBug
    fi
}

exitCode () {
    if [[ -e ./operations/exit.sh ]]; then
        echo -e "\e[1;33mEnter 1 argument or enter  to exit without exit code"
        echo -e "1. exit code or y\e[0m"
        read code
        if ! [[ -z "$code" ]]
        then
            . ./operations/exit.sh $isInteractive $code
        fi
    else
        getBug
    fi
}

help () {
    if [[ -e ./operations/help.txt ]]; then
        cat help.txt
    else
        getBug
    fi
}

interactive () {
    if [[ -e ./operations/interactive.sh ]]; then
        . ./operations/interactive.sh
    else
        getBug
    fi
}

while true
do
	menu
	read command
	if [[ $command == "a" ]] || [[ $command == "calc" ]] || [[ $command == "a. calc" ]]; then
		calc
	else if [[ $command == "b" ]] || [[ $command == "search" ]] || [[ $command == "b. search" ]]; then
		search
	else if [[ $command == "c" ]] || [[ $command == "reverse" ]] || [[ $command == "c. reverse" ]]; then
		reverse
	else if [[ $command == "d" ]] || [[ $command == "strlen" ]] || [[ $command == "d. strlen" ]]; then
		strlen
	else if [[ $command == "e" ]] || [[ $command == "log" ]] || [[ $command == "e. log" ]]; then
		log
	else if [[ $command == "f" ]] || [[ $command == "exit" ]] || [[ $command == "f. exit" ]]; then
		exitCode
	else if [[ $command == "g" ]] || [[ $command == "help" ]] || [[ $command == "g. help" ]]; then
		help
	else if [[ $command == "h" ]] || [[ $command == "interactive" ]] || [[ $command == "h. interactive" ]]; then
		interactive
	else if [[ $command == "x" ]] || [[ $command == "quit" ]] || [[ $command == "q" ]]; then
		exit
	fi
	fi
	fi
	fi
	fi
	fi
	fi
	fi
	fi
done
