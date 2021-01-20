#!/bin/bash

[ -d "/home/m_rassska/src" ] || { echo "/home/m_rassska/src doesn't exist, please first create it"; exit -1; }

createTime=$(date -d "$(echo $(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}") | sed "s/Backup-//")" +'%s')

diffBetweenCreateTime=$(($(date -d "$(date +'%F')" +'%s') - createTime))
diff=$((diffBetweenCreateTime/3600/24))



if [[ "$diff" -gt 7 || ! $(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}") ]]; then
    mkdir /home/m_rassska/Backup-$(date +'%F')
    cp -r /home/m_rassska/src/* /home/m_rassska/Backup-$(date +'%F')
    files=$(ls /home/m_rassska/Backup-$(date +'%F'))
    echo -e "new dir created: Backup-$(date +'%F') date: $(date +'%F');\nfiles : $files" >> /home/m_rassska/backup-report
    exit
fi
    
for curr in $(ls /home/m_rassska/src)
do
    
    if [[ -f /home/m_rassska/$(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")/$curr ]]; then
        pSize=$(wc -c /home/m_rassska/$(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")/$curr | awk '{print $1}')
        currSize=$(wc -c /home/m_rassska/src/$curr | awk '{print $1}')

        if [[ "$pSize" != "$currSize" ]]; then
            newPointName="$curr.$(date +'%F')"

            mv /home/m_rassska/$(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")/$curr /home/m_rassska/$(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")/$newPointName
            cp /home/m_rassska/src/$curr /home/m_rassska/$(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")
            echo "$newPointName $curr" >> diffFiles.txt
        fi

    else

        cp /home/m_rassska/src/$curr /home/m_rassska/$(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")
        echo $curr >> refFiles.txt
    fi

done

echo "new directory is: $(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}") date: $(date +'%F')" >> /home/m_rassska/backup-report
[ -s refFiles.txt ] && { echo "ref files: $(cat refFiles.txt)" >> /home/m_rassska/backup-report; }
[ -s diffFiles.txt ] && { echo "diff files: $(cat diffFiles.txt)" >> /home/m_rassska/backup-report; }
    

rm -rf refFiles.txt diffFiles.txt