#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/genome/

# run
f_a='sheep_chr_num.fna'

#ultra -ml 100 -mu 10 -n 2 -f chr7.anno chr7.fa > log

trf $f_a 2 7 7 80 10 50 500 -f -d -m
TRFdat_to_bed.py --dat $f_a.2.7.7.80.10.50.500.dat --bed $f_a.trf.bed

# kk
