#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs/

# combine
head -n 1 cal/pbs_ssa4.24.pbs > sig/pbs.all.h
seq 26 | while read i_d
do
cat cal/pbs_ssa4.$i_d.pbs | tail -n +2
done > sig/pbs.all.b

cat pbs.all.h pbs.all.b > pbs.all.tsv

# top_1
top.r pbs.all.tsv sheep

cut -f1-7 top.pbs.all.b | sort -k1,1 -k2,2 > p1.pbs.all.top.tsv
cut -f1-7 pbs.all.b | sort -k1,1 -k2,2 > p1.pbs.all.tsv

# reorder
f_l='top1.pbs.all.tsv'
paste <(cut -f1-2 $f_l) <(cut -f4 $f_l) <(cut -f6 $f_l) > ${f_l%.tsv}.bed

tail -n +2 ${f_l%.tsv}.bed | sort -k1,1g -k2,2n > ${f_l%.tsv}.st.bed

# kk