#!/bin/bash

[ -d "/home/m_rassska/restPoints" ] && rm -rf /home/m_rassska/restPoints || mkdir /home/m_rassska/restPoints
[ -z $(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}" | sort -n -r | head -n 1) ] && { echo "there are no backUp files"; exit -2; }

for currPoint in $(ls /home/m_rassska/$(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}" | sort -n -r | head -n 1) | grep -Ev "\.[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}$")
do
    cp /home/m_rassska/$(ls /home/m_rassska | grep -E "Backup-[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}" | sort -n -r | head -n 1)/$currPoint /home/m_rassska/restPoints/
done