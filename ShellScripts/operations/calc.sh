#!/bin/bash

isNumber='^[+-]?[0-9]+$'
isNotZero='^-?[1-9][0-9]*$'

if [[ $2 =~ $isNumber ]]; then
    if [[ $3 =~ $isNumber ]]; then
        if [[ "$1" != "sum" && "$1" != "sub" && "$1" != "mul" && "$1" != "div" ]]; then
            echo -ne "\e[1;41m Error: \e[0m" >&2
            echo "There is no such function. Please recheck the 2nd arg" >&2
            echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            exit 1

        fi
        
        if [[ $1 = "sum" ]]; then
            shift
            echo -ne "\e[32mok: \e[0m" >&2
            echo "$(( $1 + $2 ))">&1
        elif [[ $1 = "sub" ]]; then
            shift
            echo -ne "\e[32mok: \e[0m" >&2
            echo $(( $1 - $2 ))>&1
        elif [[ $1 = "mul" ]]; then
            shift
            echo -ne "\e[32mok: \e[0m" >&2
            echo $(( $1 * $2 ))>&1
        elif [[ $1 = "div" ]]; then
            if ! [[ $3 =~ isNotZero ]]; then
                echo -ne "\e[1;41m Error: \e[0m" >&2
                echo "Divided by zeroooo!!!!" >&2
                echo "Do you want to get information about operations? (yes/no)?" >&1
                    read needHelp
                    if [[ $needHelp == "yes" ]]; then
                        cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
                    fi
                    exit 1
            else
                shift
                echo -ne "\e[32mok: \e[0m" >&2
                echo $(( $1 / $2 ))>&1
            fi
        fi
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The last arg isn't an integer number" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            exit 1

        
    fi
else
    echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "The 3rd arg isn't an integer number" >&2
        echo "Do you want to get information about operations? (yes/no)?" >&1
            read needHelp
            if [[ $needHelp == "yes" ]]; then
                cat /home/rasul/dev/OperatingSystems/ShellScripts/help.txt | more
            fi
            exit 1
fi
