#!/usr/bin/env bash

# kadai05b 2023年05月19日

echo 'A type ...-...-... :' $(grep -E -o -e '[0-9]+-[0-9]+-[0-9]+' $1 | wc -l)
echo 'B type (...)...-... :' $(grep -E -o -e '\([0-9]+\)[0-9]+-[0-9]+' $1 | wc -l)
echo 'C type ...(...)... :' $(grep -E -o -e '[0-9]+\([0-9]+\)[0-9]+' $1 | wc -l)

# 実行コマンド + 実行結果
