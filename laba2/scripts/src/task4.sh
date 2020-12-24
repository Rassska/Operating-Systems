#!/bin/bash


for ProcessID in $(ps --no-headers -ef | awk '{print $2}') 
do
	
    ProcessPID=$(cat /proc/"$ProcessID"/status | awk '{if ($1 == "PPid:") print $2}')
    Average_Running_Time=$(cat /proc/"$ProcessID"/sched | awk '{if ($1 == "se.sum_exec_runtime") x=$3; if ($1 == "nr_switches") y=$3; if (-n x && -n y && y!=0) {print x/y; y=0}}')


    if [[ -n "$ProcessPID" && -n "$Average_Running_Time" ]];
        then echo "$ProcessID $ProcessPID $Average_Running_Time"
	fi
    
done | sort -n -k 2 | awk '{print "ProcessID="$1" : ParentProcessID="$2" : Average_Running_Time="$3""}' > task4Out.txt


sed -i 's/,/./g' task4Out.txt


# The "sum_exec_runtime/nr_switches" number is also interesting:
# it shows the average time ('scheduling atom') a task has spent
# executing on the CPU between two context-switches. The lower
# this value, the more context-switching-happy a task is.
