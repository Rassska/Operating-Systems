#!/bin/bash
ps ax | grep -E "[[:space:]]+/sbin/+" | awk '{print $1}' > task2Out.txt