gcc program.c -o program.out

./program.out 1 2 Y < in.txt
./program.out 1 2 Y > out.txt

# stderrをstdoutへリダイレクト
./program.out 1 2 Y 2>&1 | less

# stdoutからの出力を捨てる
./program.out 1 2 Y > /dev/null

# stdout、stderrからの出力を捨てる
./program.out 1 2 Y > /dev/null 2>&1

# stdoutからの出力を捨て、stderrをstdoutへリダイレクト
./program.out 1 2 Y 2>&1 > /dev/null

rm program.out

cat out.txt

rm out.txt