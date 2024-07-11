#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/pbs

# pop
run_pbs_sample.sh

# pbscan
run_pbscan.sh

# sig_pbs
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/pbs/pbs_can

head -n 1 pbs_ssa4.24.pbs > ../pbs_filter/pbs.all.h
seq 26 | while read i_d
do
cat pbs_ssa4.$i_d.pbs | tail -n +2
done > ../pbs_filter/pbs.all.b

#cat pbs.all.h pbs.all.b > pbs.all.tsv

#awk '$7<0.05' pbs.all.b | cut -f1-7 > p1.pbs.all.b.sig

#cut -f1-7 top.pbs.all.b > p1.pbs.all.b.top
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/pbs/pbs_filter

top.r pbs.all.b "X6" 0.01

cut -f1-7 top.pbs.all.b | sort -k1,1 -k2,2 > p1.pbs.all.top.tsv
cut -f1-7 pbs.all.b | sort -k1,1 -k2,2 > p1.pbs.all.tsv

## reorder
f_l='p1.pbs.all.top.tsv'
paste <(cut -f1-2 $f_l) <(cut -f4 $f_l) <(cut -f3 $f_l) <(cut -f5- $f_l) > ${f_l%.tsv}.bed

cut -f1,2,3,6 p1.pbs.all.top.bed > p1.pbs.all.top.simple.bed

## ai_region
bedtools intersect -a p1.pbs.all.top.simple.bed -b fdm.bed > ai.tsv # just overlaped region
sort -k1,1g -k2,2n ai.tsv > ai.s.tsv
bedtools merge -i ai.s.tsv > ai.mg.tsv

# shuf
left_join.r p1.pbs.all.tsv ai.s.tsv 'c("X1","X3"="X4")' test.tsv
awk '$8=="NA"' test.tsv | shuf -n 10000 | cut -f1-7 > p1.pbs.all.shuf.tsv

# anno
run_pbs_anno.sh

# kk
