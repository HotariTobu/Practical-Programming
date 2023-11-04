#!/bin/sh

# 引数として渡された2つの数値の和を計算する関数
sum() {
  # 引数が2つでない場合はエラーメッセージを表示して終了
  if [ $# -ne 2 ]; then
    echo "引数は2つ必要です"
    exit 1
  fi

  # 引数を足して結果を出力
  echo $(($1 + $2))
}

# 関数を呼び出して結果を出力
sum 3 5