#!/usr/bin/env bash

# kadai08b 2023年06月09日

for c in $(seq 0x1D434 0x1D467); do
    if [[ c -eq 119886 ]]; then
        echo
    elif [[ c -eq 119893 ]]; then
        echo -en "\u210E"
        continue
    fi

    ch=$(printf '%08X' $c)
    echo -en "\U$ch"

    if [[ c -eq 119911 ]]; then
        echo
    fi
done

# 実行コマンド + 実行結果
# 2XXXX1@ISE7Cu:~/Practical-Programming/20230609$ bash kadai08b.sh
# 𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍
# 𝑎𝑏𝑐𝑑𝑒𝑓𝑔ℎ𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧
