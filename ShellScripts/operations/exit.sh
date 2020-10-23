#! /bin/bash

isNumber='^[+-]?[0-9]+$'
isInteractive="$1"

shift # remove data of is Interactive or not

if [[ "$1" =~ $isNumber ]] || [[ -z "$1" ]]; then
    if [[ -z "$1" ]]; then
        if [[ $isInteractive == "no" ]]; then
            exit 6
        fi
    fi

    if (( "$1" >= 0 && "$1" <= 255 )); then
        if [[ $isInteractive == "no" ]]; then
            exit $1
        fi
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo ""$1" is not available in the range [0-255]" >&2
        if [[ $isInteractive == "no" ]]; then
            exit 6
        fi
    fi

else
    echo -ne "\e[1;41m Error: \e[0m" >&2
    echo "Code isn't the number!" >&2
    if [[ $isInteractive == "no" ]]; then
        exit 6
    fi
fi