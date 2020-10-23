#! /bin/bash


if [[ -e $1 ]]; then # if the first file is existing
	if [[ -r $1 ]]; then # if the permission for reading is available
		if [[ -s $1 ]]; then # if given file is not empty
			if [[ -e $2 ]]; then # if the second file is existing
				if [[ -d $2 || -d $1 ]]; then # if the give path is directory
					echo -ne "\e[1;41m Error: \e[0m" >&2
					echo "It's a directory" >&2
					exit 3
				fi
				if [[ -w $2 ]]; then # if all is ok
					tac $1 >> temp.txt
   					rev temp.txt > $2
  					rm temp.txt
				else
					echo -ne "\e[1;41m Error: \e[0m" >&2
                    echo "There is no permission for the writing" >&2
					exit 3
				fi
				
			else
				if ! touch "$2" 2>/dev/null
				then
					echo -ne "\e[1;41m Error: \e[0m" >&2
					echo "There is no permission to create file here!" >&2
					exit 3
				else
					touch "$2"
					tac $1 >> temp.txt
   					rev temp.txt > $2
  					rm temp.txt
				fi
			fi
		else
			echo -ne "\e[1;41m Error: \e[0m" >&2
			echo "File '$1' is empty" >&2
			exit 3
		fi
	else
		echo -ne "\e[1;41m Error: \e[0m" >&2
		echo "'$1': Read permission is not available" >&2
		exit 3
	fi
else
	echo -ne "\e[1;41m Error: \e[0m" >&2
	echo "'$1':There is no such file found">&2
	exit 3
fi