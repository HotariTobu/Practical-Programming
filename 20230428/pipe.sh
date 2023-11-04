gcc program.c -o program.out

echo Standard I/O $'\n' $'\n' | ./program.out

# stdoutとstderrをstdinにつなぐ
echo Standard I/O $'\n' $'\n' | ./program.out |& less

rm program.out
