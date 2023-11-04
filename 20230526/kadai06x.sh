#!/usr/bin/env bash

# kadai06x 2023年05月26日

for i in $(seq $1); do
    num1=$(bash kadai05a.sh)
    num2=$(bash kadai05a.sh)
    printf '電話番号%02d-1: %s, 電話番号%02d-2: %s\n' $i "$num1" $i "$num2"
done

# 実行コマンド + 実行結果
