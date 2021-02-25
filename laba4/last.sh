#!/bin/bash
currPath="/home/m_rassska"

LastBackUpName=$(ls $currPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}" | sort -n -r | head -n 1)

[ -d "$currPath/restore" ] && rm $currPath/restore/* || mkdir $currPath/restore


for currFile in $(ls $currPath/$LastBackUpName | grep -Ev "\.[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}$")
do
    cp $currPath/$LastBackUpName/$currFile $currPath/restore/
done