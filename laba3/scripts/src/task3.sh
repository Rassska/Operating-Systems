#!/bin/bash
touch helper
crontab -l > helper
echo "*/5 * * * 1 /home/rassska/dev/OS/laba3/scripts/src/task1.sh" >> helper
crontab helper
rm -rf helper