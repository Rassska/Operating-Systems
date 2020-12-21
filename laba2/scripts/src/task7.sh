#!/bin/bash
echo -n > task7Out.txt
IFS=$'\n'

for i in $(ps --no-headers -ef | awk '{print $2 " " $8}')
do
    pid=$(echo $i | awk '{print $1}')
    mem=$(cat /proc/$pid/io 2>/dev/null | grep "read_bytes" | awk '{print $2}')
    path=$(echo $i | awk '{print $2}')
    echo "$pid $path $mem" >> task7Out.txt
done

sleep 10

    echo -n > helper.txt
    
for i in $(ps --no-headers -ef | awk '{print $2 " " $8}')
do
    pid=$(echo $i | awk '{print $1}')
    mem=$(cat /proc/$pid/io 2>/dev/null | grep "read_bytes" | awk '{print $2}')
    path=$(echo $i | awk '{print $2}')
    echo "$pid $path $mem" >> helper.txt

done

for i in $(cat helper.txt)
do
    curpid=$(echo $i | awk '{print $1}')
    mem=$(echo $i | awk '{print $3}')
    path=$(echo $i | awk '{print $2}')
    prevmem=$(cat task7Out.txt | awk -v pid="$curpid" '{if ($1 == pid) print $3}')
    if [[ $prevmem == "" ]];then
        continue
    fi

    res=$(echo "$mem - $prevmem" | bc)
        echo "$curpid:$path:$res"

done | sort -n -r -k 3 | head -n 3

rm task7Out.txt helper.txt


