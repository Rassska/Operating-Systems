#!/bin/bash

isInteractive="$1"

shift # remove data of is Interactive or not

if [[ -e "/home/rasul/dev/OperatingSystems/ShellScripts/X.log" ]]; then # /var/log/anaconda/X.log
	if [[ -r "/home/rasul/dev/OperatingSystems/ShellScripts/X.log" ]]; then # /var/log/anaconda/X.log
		while read line
		do
			if [[ "$line" == *"(WW)"* && "$line" != *"(WW) warning, (EE) error, (NI) not implemented, (??) unknown."* ]]
			then
				echo -e ${line//"(WW)"/"\e[1;33mWarning:\e[0m"}
			fi
		done < "/home/rasul/dev/OperatingSystems/ShellScripts/X.log" # /var/log/anaconda/X.log

		while read line
		do
			if [[ "$line" == *"(II)"* && "$line" != *"(++) from command line, (!!) notice, (II) informational,"* ]]
			then
				echo -e ${line//"(II)"/"\e[1;36mInformation:\e[0m"}
			fi
		done < "/home/rasul/dev/OperatingSystems/ShellScripts/X.log" # /var/log/anaconda/X.log
	else
		echo -ne "\e[1;41m Error: \e[0m" >&2
		echo "There is no permission to read this file!" >&2
		if [[ $isInteractive == "no" ]]; then
            exit 5
        fi
	fi
else
	echo -ne "\e[1;41m Error: \e[0m" >&2
	echo "There is no such file or directory!" >&2
	if [[ $isInteractive == "no" ]]; then
            exit 5
        fi
fi