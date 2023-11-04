if [[ -t 0 ]]; then
    echo 入力
fi

if [[ -t 1 ]]; then
    echo 出力
fi

if [[ -t 2 ]]; then
    echo エラー
fi

# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ bash detect_terminal.sh
# 入力
# 出力
# エラー
# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ bash detect_terminal.sh <(ls)
# 入力
# 出力
# エラー
# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ ls | bash detect_terminal.sh
# 出力
# エラー
# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ bash detect_terminal.sh > out.txt
# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ bash detect_terminal.sh 2&>1 out2.txt
# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ bash detect_terminal.sh 2>&1 out2.txt
# 入力
# 出力
# エラー
# 2XXXX1@ISE88u:~/Practical-Programming/20230623$ bash detect_terminal.sh 1&>2 out2.txt
# 2XXXX1@ISE88u:~/Practical-Programming/20230623$
