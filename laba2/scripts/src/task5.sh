#!/bin/bash

echo -n > task5Out.txt

IFS=$'\n'
i=1
avtime=0
ppid=$(cat task4Out.txt | head -n 1 | awk '{print $3}')

for j in $(cat task4Out.txt) #j is a line of task4Out.txt
do

    curppid=$(echo "$j" | awk '{print $3}')
    curtime=$(echo "$j" | awk -F= '{print $4}')

    if [[ "$curppid" == "$ppid" ]]; then
        i=$(($i+1))
        avtime=$(echo "scale=5;$avtime+$curtime" | bc -l)
        
    else
        valueOfppid=$(echo "$ppid" | awk -F= '{print $2}')
        valueOfAv=$(echo "scale=5; $avtime/$i" | bc)
        echo "Average_Sleeping_Children_of_ParentID=$valueOfppid is $valueOfAv" >> task5Out.txt
        ppid=$curppid
        i=1
        avtime=$curtime
    fi

    echo "$j" >> task5Out.txt
done

valueOfppid=$(echo "$ppid" | awk -F= '{print $2}')
valueOfAv=$(echo "scale=5;$avtime/$i" | bc)
echo "Average_Sleeping_Children_of_ParentID=$valueOfppid is $valueOfAv" >> task5Out.txt
