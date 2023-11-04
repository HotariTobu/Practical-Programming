echo Hello        Bash
echo "Hello        Bash"

ME="I    am    a     シェル芸人"
echo $ME
echo "$ME"

bash quote_param.sh a b "c     d"

echo "\$   \`   \\   \n   $ME   $(date "+%Y年%m月%d日")"
echo '\$   \`   \\   \n   $ME   $(date "+%Y年%m月%d日")'
echo $'\$   \`   \\   \n   $ME   $(date "+%Y年%m月%d日")'

# echo Apple's new CPU
echo "Apple's new CPU"
# echo 'Apple\'s new CPU'
echo 'Apple'\''s new CPU'
echo $'Apple\'s new CPU'