wget 'https://ftp.gnu.org/gnu/bash/bash-5.2.tar.gz'
tar -zxvf 'bash-5.2.tar.gz'

if [[ $? -ne 0 ]]; then
    exit 1
fi

cd 'bash-5.2'

./configure
make