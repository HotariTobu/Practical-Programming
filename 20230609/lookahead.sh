echo 'Reg. Exp.' | grep -P '\w+(?=\..)'

echo "1234567890" | perl -pe 's/\d(?=(\d{3})+(\D|$))/\0,/g'

echo 'Reg. Exp.' | grep -P '\w+(?!\..)'

