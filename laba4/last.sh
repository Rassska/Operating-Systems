#!/bin/bash
mainPath="/home/m_rassska"
[ -d "$mainPath/restPoints" ] && rm $mainPath/restPoints/* || mkdir $mainPath/restPoints

findParPoint=$(ls $mainPath | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}" | sort -n -r | head -n 1)
[ -z $findParPoint ] && { echo "there are no backUp files"; exit -2; }

for currPoint in $(ls $mainPath/$findParPoint | grep -Ev "\.[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}$")
do
    cp $mainPath/$findParPoint/$currPoint $mainPath/restPoints/
done