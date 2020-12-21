#!/bin/bash

result=$(ps a -U $(whoami))

echo "$result" | wc -l > task1Out.txt
echo "$result" | awk '{print $1 ":" $5}' >> task1Out.txt

