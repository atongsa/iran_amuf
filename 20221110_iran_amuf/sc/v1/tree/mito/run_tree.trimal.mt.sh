#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/phylo/mito/fa

# select_926
i_d='sel.id'
fa_msa='o.all.msa.fa'
seqkit grep -f $i_d $fa_msa > sel.fa

# trim
f_a='sel.fa'
fa_op='sel.trim.fa'
trimal -automated1 -resoverlap 0.75 -seqoverlap 75 -in $f_a -out $fa_op

# kk
