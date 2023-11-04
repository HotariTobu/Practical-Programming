#!/usr/bin/env bash

# kadai05a 2023年05月19日

type=$(( $RANDOM % 3 ))
case $type in
    0) CH1='' CH2='-' CH3='-';;
    1) CH1='(' CH2=')' CH3='-';;
    2) CH1='' CH2='(' CH3=')';;
esac

# echo $type $CH1 $CH2 $CH3

NUM1=$(( $RANDOM % 4 + 2 ))
NUM2=$(( 6 - $NUM1 ))
NUM3=4

echo -n $CH1
echo -n 0

NUM1=$(( $NUM1 - 1 ))
for _ in $(seq $NUM1); do
    echo -n $(( $RANDOM % 10 ))
done

echo -n $CH2

for _ in $(seq $NUM2); do
    echo -n $(( $RANDOM % 10 ))
done

echo -n $CH3

for _ in $(seq $NUM3); do
    echo -n $(( $RANDOM % 10 ))
done

echo

# 実行コマンド + 実行結果
