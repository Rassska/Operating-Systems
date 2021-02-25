#!/bin/bash
IFS=$'\n'
currPath="/home/m_rassska"

commonDate=$(date +'%F')
secondsCnt=$(date -d "$commonDate" +'%s')

lastBackUpName=$(ls $currPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}" | sort -n -r | head -n 1)
lastBackUpCreatedTimeInSeconds=$(date -d "$(echo $lastBackUpName | sed "s/Backup-//")" +'%s')

# echo $secondsCnt
# exit 0
diffTime=($secondsCnt - $lastBackUpCreatedTimeInSeconds)
diffTime=$((diffTime/24/3600))
# echo "$diffTime"

if [[ "$diffTime" -gt 7 || ! $lastBackUpName ]]; then
    mkdir "$currPath/Backup-$commonDate"
    cp -r $currPath/source/* "$currPath/Backup-$commonDate"
    echo -e "Created new directory: date: $commonDate;\ncurrFiles : "$(ls $currPath/Backup-$commonDate)"" >> $currPath/backup-report
else 
    
    for currFile in $(ls "$currPath/source") 
    do
        if [[ -f $currPath/$lastBackUpName/$currFile ]]; then
            currFileSize=$(wc -c $currPath/source/$currFile)
            lastBackUpFileSize=$(wc -c $currPath/$lastBackUpName/$currFile)
            if [[ "$lastBackUpFileSize" != "$currFileSize" ]]; then
                newCurrFileVersion="$currFile.$commonDate"
                mv $currPath/$lastBackUpName/$currFile $currPath/$lastBackUpName/$newCurrFileVersion
                cp $currPath/source/$currFile $currPath/$lastBackUpName
                echo "$newCurrFileVersion $currFile" >> incrementRestorePoints
            fi
        else
            cp $currPath/source/$currFile $currPath/$lastBackUpName
            echo $currFile >> fullRestorePoints
        fi
    done

    echo "update directory: $lastBackUpName date: $commonDate" >> $currPath/backup-report
    [ -s fullRestorePoints ] && { echo "added : $(cat fullRestorePoints)" >> $currPath/backup-report; }
    [ -s incrementRestorePoints ] && { echo "changed : $(cat incrementRestorePoints)" >> $currPath/backup-report; }

fi
    







