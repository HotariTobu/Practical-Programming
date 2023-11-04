#!/bin/bash

for i in $(seq 5); do
    echo "Line 1 - Iteration $i"
    echo "Line 2 - Iteration $i"
    echo "Line 3 - Iteration $i"
    printf "Line 4 - Iteration $i\n"

    sleep 1

    # カーソルを2行上に移動して2行分削除する
    printf "\033[4A"
    # printf "\033[2A\033[2K"
done
