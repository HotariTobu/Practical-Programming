echo -e "Hello\nWorld" > 'sample1.txt'
echo -e "Hi\nWorld" > 'sample2.txt'

diff -u 'sample1.txt' 'sample2.txt' > 'sample.patch'
cat 'sample.patch'

patch -p0 < 'sample.patch'
