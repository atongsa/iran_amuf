#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/phylo/mito/fa

# msa
cd /public/home/d0202110815/at42/proj/iran_sheep/ana/mito/msa/ma_fft
mafft --auto o.all.fa > o.all.msa.fa

# long_2_short
seqkit replace -p "\s.+$" o.all.msa.fa > o.mafft.msa.s.fa

# kk
