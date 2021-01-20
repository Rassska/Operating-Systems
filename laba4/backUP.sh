#!/bin/bash


mainPath="/home/m_rassska"
[ -d "$mainPath/src" ] || { echo "$mainPath/src doesn't exist, please first create it"; exit -1; }

createTime=$(date -d "$(echo $(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}") | sed "s/Backup-//")" +'%s')

diffBetweenCreateTime=$(($(date -d "$(date +'%F')" +'%s') - createTime))
diff=$((diffBetweenCreateTime/3600/24))



if [[ "$diff" -gt 7 || ! $(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}") ]]; then

    
    mkdir $mainPath/Backup-$(date +'%F')
    cp -r $mainPath/src/* $mainPath/Backup-$(date +'%F')
    filesList=$(ls $mainPath/Backup-$(date +'%F'))
    echo -e "new directory was created: Backup-$(date +'%F') date: $(date +'%F');\nfiles : $filesList" >> $mainPath/backup-report

else
    
    for curr in $(ls $mainPath/src)
    do
        
        if [[ -f $mainPath/$(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")/$curr ]]; then
            pSize=$(wc -c $mainPath/$(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")/$curr | awk '{print $1}')
            currSize=$(wc -c $mainPath/src/$curr | awk '{print $1}')

            if [[ "$pSize" != "$currSize" ]]; then
                newPointName="$curr.$(date +'%F')"

                mv $mainPath/$(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")/$curr $mainPath/$(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")/$newPointName
                cp $mainPath/src/$curr $mainPath/$(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")
                echo "$newPointName $curr" >> diffFiles.txt
            fi

        else

            cp $mainPath/src/$curr $mainPath/$(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")
            echo $curr >> refFiles.txt
        fi

    done

    echo "new directory: $(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}") date: $(date +'%F')" >> $mainPath/backup-report
    [ -s refFiles.txt ] && { echo "ref files: $(cat refFiles.txt)" >> $mainPath/backup-report; }
    [ -s diffFiles.txt ] && { echo "diff files: $(cat diffFiles.txt)" >> $mainPath/backup-report; }
    
fi

rm -rf refFiles.txt diffFiles.txt