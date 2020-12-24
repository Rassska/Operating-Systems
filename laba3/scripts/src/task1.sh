#!/bin/bash

mkdir "$HOME/test" && {
    echo "test successfully created" > ~/report.txt
    touch $HOME/test/$(date +'%F_%H-%M-%S'); };

ping www.net_nikogo.www || echo "$(date +'%F_%H-%M-%S') can't reach the host" >> ~/report.txt