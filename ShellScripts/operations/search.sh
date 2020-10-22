#! /bin/bash

if [[ -d $1 ]]; then
    if [[ -r $1 ]]; then
        grep -r -s "$2" "$1"
    else
        echo -ne "\e[1;41m Error: \e[0m" >&2
        echo "'$1': Read permission denied" >&2
        exit 2
    fi
else
    echo -ne "\e[1;41m Error: \e[0m" >&2
    echo "'$1': There is no such directory" >&2
    exit 2
fi