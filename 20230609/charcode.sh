echo 'sampleテキスト' > sample.txt

hexdump -C sample.txt

iconv -f UTF-8 -t SJIS sample.txt > sample-sjis.txt
iconv -f SJIS -t UTF-8 sample-sjis.txt > sample-utf8.txt