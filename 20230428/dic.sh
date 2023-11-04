declare -A my_array
my_array["key1"]="value1"
my_array["key2"]="value2"
for key in "${!my_array[@]}"; do
  echo "${key}=${my_array[$key]}"
done
