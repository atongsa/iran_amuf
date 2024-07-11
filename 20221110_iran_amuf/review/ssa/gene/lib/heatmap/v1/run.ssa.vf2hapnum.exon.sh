#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/hap_heatmap/ai_exon

# args
op_p='exon.hap'

## vf2hap
v_f='pcdh9.exon.vcf'
plink2 --vcf $v_f --export haps --out $op_p

# num2chr
cut -f2 $op_p.sample -d' '| tail -n+3 | awk '{print $1"_1\n"$1"_2"}' > sample.id

cut -f6- $op_p.haps -d' ' |\
tr ' ' '\t' |\
datamash transpose > $op_p.tsv

paste sample.id $op_p.tsv > $op_p.mat

# kk