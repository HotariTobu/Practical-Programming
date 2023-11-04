for i in 1 2 3 4; do echo $i; done
for i in {1..10}; do echo $i; done
for i in {ab,cd,e}; do echo $i; done
for i in {ab, cd,e}; do echo $i; done

os="{o1,a1} {o2,a2}"
for o in $os; do echo $o; done

# os="{o=1 a=1,o=2 a=2}"
# for o in $os; do $o; echo $o; done