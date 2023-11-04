#!/usr/bin/env bash

# kadai03a 2023年04月28日

# 1. 引数の確認
if [[ $# -ne 1 ]]; then
    echo "使い方：$0 C/C++のソースファイルの名前"
    exit 1
fi

fn=${1%.*}

# 2. ソースコードのコンパイル
echo '$' g++ -Wall -std=c++17 $1 -o $fn.out
g++ -Wall -std=c++17 $1 -o $fn.out

# 3. 実行可能ファイルの実行
if [[ $? -ne 0 ]]; then
    exit 2
fi

echo '$' ./$fn.out
./$fn.out

# 実行コマンド + 実行結果

# 2XXXX1@ISE7Cu:~/Practical-Programming/20230428$ ./kadai03a.sh
# 使い方：./kadai03a.sh C/C++のソースファイルの名前
# 2XXXX1@ISE7Cu:~/Practical-Programming/20230428$ ./kadai03a.sh hello.cpp
# $ g++ -Wall -std=c++17 hello.cpp -o hello.out
# hello.cpp: 関数 ‘int main()’ 内:
# hello.cpp:4:46: エラー: expected ‘;’ before ‘}’ token
#     4 |     std::cout << "Hello, world!" << std::endl
#       |                                              ^
#       |                                              ;
#     5 | }
#       | ~
# 2XXXX1@ISE7Cu:~/Practical-Programming/20230428$ ./kadai03a.sh hello.cpp
# $ g++ -Wall -std=c++17 hello.cpp -o hello.out
# $ ./hello.out
# Hello, world!
