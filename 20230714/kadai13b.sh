#!/usr/bin/env bash

# kadai13b 2023年07月14日

trap 'echo -e "\033[?25h"; exit' SIGINT

echo -en "\033[?25l"

max=400
for ((i=0; i < $max; i++)); do
    sleep 0.01

    w=$(($i % 8))
    if [[ w -ne 0 ]]; then
        echo -en "\b"
    fi

    ch=$(printf '%08X' $((0x258F - w)))
    echo -en "\U$ch"
done

echo -e "\033[?25h"

# 実行コマンド + 実行結果

# 2XXXX1@ISE7Cu:~/Practical-Programming/20230714$ bash kadai13b.sh
# ██████████████████████████████████████████████████
# 2XXXX1@ISE7Cu:~/Practical-Programming/20230714$ bash kadai13b.sh
# █████▊^C
# 2XXXX1@ISE7Cu:~/Practical-Programming/20230714$ bash kadai13b.sh
# ███████████████████████████████████████████████▉^C
