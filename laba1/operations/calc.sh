#!/bin/bash


    if [[ $1 = "sum" ]]; then
        shift
        echo -ne "\e[32mok: \e[0m"
        echo "$(( $1 + $2 ))"
    elif [[ $1 = "sub" ]]; then
        shift
        echo -ne "\e[32mok: \e[0m"
        echo $(( $1 - $2 ))
    elif [[ $1 = "mul" ]]; then
        shift
        echo -ne "\e[32mok: \e[0m"
        echo $(( $1 * $2 ))
    elif [[ $1 = "div" ]]; then
        shift
        echo -ne "\e[32mok: \e[0m"
        echo $(( $1 / $2 ))
    fi


    