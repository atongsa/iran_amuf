#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/v2/mito/aln

# trim
f_a='mito.1104.aln.fa'
op_n='mito.1104.trim.fa'

trimal -automated1 -resoverlap 0.75 -seqoverlap 75 -in $f_a -out $op_n

# kk