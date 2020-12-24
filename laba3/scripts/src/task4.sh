#!/bin/bash

cpulimit -l 10 -- /home/rassska/dev/OS/laba3/scripts/src/task4helper.sh &
cpulimit -l 10 -- /home/rassska/dev/OS/laba3/scripts/src/task4helper.sh &
cpulimit -l 10 -- /home/rassska/dev/OS/laba3/scripts/src/task4helper.sh &

third_PID=$!

kill $third_PID