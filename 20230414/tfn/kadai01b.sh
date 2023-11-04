#!/usr/bin/env bash

# kadai01a 2023年04月14日

for ARG in $@; do
    FILE=kadai$ARG.cpp
    if [[ -e $FILE ]]; then
        echo $FILE：スキップしました
    else
        bash ./make_cpp.sh $ARG > $FILE
        echo $FILE：新規ファイルを作成しました
    fi
done
