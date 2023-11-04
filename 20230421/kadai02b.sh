#!/usr/bin/env bash

# kadai02b 2023年04月21日

for f in *.cpp; do
    n=${f%.*}
    d=$(date "+%Y年%m月%d日")
    e=${f##*.}
    mv $f ${n}_${d}.${e}
done
