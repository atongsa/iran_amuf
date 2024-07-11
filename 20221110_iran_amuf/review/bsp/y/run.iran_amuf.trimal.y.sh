#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/bsp/y/msa

# # select_926
# i_d='sel.id'
# fa_msa='o.all.msa.fa'
# seqkit grep -f $i_d $fa_msa > sel.fa

# n2gap
#seqkit replace -p "n" -r "-" -s o.msa.fa > o.msa.gap.fa

# trim
f_a='o.spe.nohet.nogap.fa'
fa_op='o.msa.trim.fa'
trimal -automated1 -resoverlap 0.75 -seqoverlap 75 -in $f_a -out $fa_op

# kk
