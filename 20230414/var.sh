#!/bin/bash

# PROG = プログラミング
PROG=プログラミング

echo 実践$PROG 2023
echo 実践$PROG_2023
echo 実践${PROG}_2023

A1=Apple
N=1

echo $A1
echo $N

eval "echo \${A$N}"

# ポインター変数
P=A$N
echo ${!P}

N=2
declare A$N=Orange
echo $A2

m="2 3"
echo $m

m=2 n=3
echo $m
echo $n