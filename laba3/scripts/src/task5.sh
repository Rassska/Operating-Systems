#!/bin/bash

for (( i=1; i <= 10;))
do
    read string;
    echo "$string" > pipe
done