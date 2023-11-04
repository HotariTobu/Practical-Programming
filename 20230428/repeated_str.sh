# str_repeat() {
#     str=$1
#     count=$2
#     echo "$(printf %${count}s | sed "s/ /${str}/g")"
# }

# str_repeat Apple 5

for _ in {1..5}; do echo "Apple"; done

yes "Apple" | head -n 5

echo $(printf '%.0sApple' {1..5})

seq 5 | xargs -I{} echo "Apple"

repeat_str() {
    str=$1
    count=$2
    for _ in `seq $count`; do
        printf "$str"
    done
}

repeat_str Banana 3