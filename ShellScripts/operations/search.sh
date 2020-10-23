#! /bin/bash

isInteractive="$1"

shift # remove data of is Interactive or not

if [[ -d $1 ]]; then
    if [[ -r $1 ]]; then
        grep -r -s "$2" "$1"
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "'$1': Read permission denied" >&2
        if [[ $isInteractive == "no" ]]; then
           	exit 2
        fi
    fi
else
    echo -ne "\e[1;41m Error: \e[0m" >&2
    echo "'$1': There is no such directory" >&2
    if [[ $isInteractive == "no" ]]; then
        exit 2
    fi
fi