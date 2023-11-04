#!/usr/bin/env bash

# kadai02a 2023年04月21日

for f in *.cpp; do
    n=${f%.*}
    mv $f ${n}.cc
done
