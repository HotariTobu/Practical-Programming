#!/usr/bin/env bash

# kadai07a 2023年06月02日

grep --color=auto -i -P -e '\b(\w+?)\b\s+?\b\1\b' $1

# 実行コマンド + 実行結果

# 2XXXX1@ISE69u:~/Practical-Programming/20230602$ bash kadai07a.sh <(echo $'It is is a pen.\nThis is a pen.\nIt is isolated.\nThis isolated pen is...\nIt is a pen pen.\nThis this is a pen.')
# It is is a pen.
# It is a pen pen.
# This this is a pen.
