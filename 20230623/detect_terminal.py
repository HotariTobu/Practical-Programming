import sys

if sys.stdin.isatty():
    print('入力')

if sys.stdout.isatty():
    print('出力')

if sys.stderr.isatty():
    print('エラー')

# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ python detect_terminal.py
# 入力
# 出力
# エラー
# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ ls | python detect_terminal.py
# 出力
# エラー
