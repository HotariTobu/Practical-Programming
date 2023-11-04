#!/usr/bin/env bash

# kadai01a 2023年04月14日

if [[ $# -ne 1 ]]; then
    echo "使い方：$0 課題番号"
    exit 1
fi

echo -n "// 課題$1 "
date "+%Y年%m月%d日"
echo "// ほたり飛ぶ (Hotari Tobu)"
echo "// 2XXXX1"
echo ""
echo "#include <iostream>"
echo ""
echo "int main()"
echo "{"
echo "    "
echo "}"
echo "/* 実行結果"
echo ""
echo "*/"
