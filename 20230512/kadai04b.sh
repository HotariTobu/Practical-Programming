#!/usr/bin/env bash

# kadai04b 2023年05月12日

# 1. 引数の確認

# 引数が指定されていないとき
if [[ $# -eq 1 ]]; then
    fp="$1"
elif [[ $# -eq 0 ]]; then
    ls *.cpp > /dev/null 2>&1

    # .cppファイルが存在しないとき
    if [[ $? -ne 0 ]]; then
        exit 3
    fi

    # カレントディレクトリにある最新の.cppファイルの名前を取得する
    fp="$(ls -t *.cpp | head -n 1)"
# 引数の数が2つ以上のとき
elif [[ $# -ne 1 ]]; then
    echo "使い方：$0 C/C++のソースファイルの名前"
    exit 1
fi

fn=${fp%.*}

# 2. ソースコードのコンパイル
echo '$' g++ -Wall -std=c++17 $fp -o $fn.out
g++ -Wall -std=c++17 $fp -o $fn.out

# 3. 実行可能ファイルの実行
if [[ $? -ne 0 ]]; then
    exit 2
fi

echo '$' ./$fn.out
./$fn.out

# 実行コマンド + 実行結果
