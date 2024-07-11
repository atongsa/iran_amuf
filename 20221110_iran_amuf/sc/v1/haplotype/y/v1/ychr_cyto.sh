#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/hapnet

# tsv
tail -n +2 cyto.tsv | awk -vOFS="\t" '{print NR,$0}' > cyto.1.tsv

sort -k1,1n -u lk.tsv > lk.1.tsv

inner_join.r cyto.1.tsv lk.1.tsv 'c("X1"="X1")' cyto.2.tsv

cat <(head -n1 cyto.tsv) cyto.2.tsv > cyto.3.tsv




# kk
