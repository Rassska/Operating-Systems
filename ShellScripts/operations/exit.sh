#! /bin/bash

isNumber='^[+-]?[0-9]+$'

if [[ "$1" =~ $isNumber ]]; then
    if (( "$1" >= 0 && "$1" <= 255)); then
        exit $1 
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo ""$1" is not available in the range [0-255]" >&2
        exit 4 
    fi
else
    echo -ne "\e[1;41m Error: \e[0m" >&2
    echo "Code isn't the number!" >&2
    exit 4
fi