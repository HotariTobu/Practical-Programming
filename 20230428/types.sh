# 整数属性を設定する
declare -i var
var=2**10
echo $var

#配列
array=(element0 element1 element2)
echo ${array[0]} ${array[1]} ${array[2]}
echo ${array[@]}