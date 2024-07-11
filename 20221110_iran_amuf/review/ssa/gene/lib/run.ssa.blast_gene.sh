#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/blast

# fa
ref_fa='/public/home/d0202110815/at42/proj/iran_amuf/genome/oa_r2/sheep_oar2.fa'

seqkit subseq --bed ai.r2.bed $ref_fa > ai.r2.fa

# seq
i_d='10_39129854-39139385:.'
seqkit grep -p $i_d ai.r2.fa > ai.pcdh9.fa

# regu_seq_func

# kk
