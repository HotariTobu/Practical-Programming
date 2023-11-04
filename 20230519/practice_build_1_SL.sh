git clone 'https://github.com/mtoyoda/sl'

if [[ $? -ne 0 ]]; then
    exit 1
fi

cd sl

make