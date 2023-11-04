for arg in $@
do
    echo $arg
done

echo $0

while [[ -nz $1 ]]
do
    echo $1
    shift
done

echo $0
echo $1