#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/s_p

cat oo2.tsv2 | while read P1
do
cat oo1.tsv | while read P2
do
cat SSA.tsv2 | while read P3
do
cat MEN.tsv | while read P4
do
cat bighorn.tsv | while read P5
do
echo $P1,$P2,$P3,$P4,$P5
done
done
done
done
done > d5_13.label

awk '{print NR,$0}' d5_13.label > d5_13.label2

# kk