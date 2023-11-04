# VAR='SOME_VALUE'

printf $VAR
echo $?

printf "$VAR"
echo $?

printf "%s" $VAR
echo $?

printf "%s" "$VAR"
echo $?
