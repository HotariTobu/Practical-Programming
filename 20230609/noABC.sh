echo 'ABA' | grep -P '^[^A]*$'
echo 'BCC' | grep -P '^[^A]*$'

echo 'ABA' | grep -P '^((?!ABC).)*$'
