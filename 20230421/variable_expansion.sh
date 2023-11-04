FILE=photo012.jpg
echo $FILE

echo ${FILE%.jpg}
echo ${FILE%.png}
echo ${FILE#photo}
echo ${FILE#image}

FILE=archive.tar.gz
echo $FILE

echo ${FILE%.*}
echo ${FILE%%.*}
echo ${FILE#*.}
echo ${FILE##*.}