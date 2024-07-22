#!/usr/bin/env bash

# run
cd /home/atongsa/Documents/projects/papers/20221110_iran_amuf/ana/mito

# 153 assembled
i_d='resub.153.id'
f_a='o.lv.867.shortname.fa'
op_n='resub.153.fa'

seqkit grep -f $i_d $f_a -o $op_n

# 10 resub
seqkit replace -p "(.+)" -r '{kv}' -k kv.id 10.c -o wild.10.fa

# sub0+deng
i_d='sub1.deng.id'
f_a='../o.lv.867.shortname.fa'
op_n='sub1.614.fa'

seqkit grep -f $i_d $f_a -o $op_n

# adna.173
f_a='Ovis_MTallOARv3_mtDNA_ancient_samples.fasta'
op_n='adna.173.fa'

awk 'BEGIN { RS = "" } { gsub(/\r/, "\n"); print }' $f_a | seqkit replace -p "^([^_]+)_([^_]+)_([^_\t]+)\s?" -r '$3' - -o $op_n

grep '>' $op_n | tr -d '>' > adna.173.id
head adna.173.id | cat -A
grep -Fxvf adna.173.id t.id | cat -A
grep -Fxvf t.id adna.173.id | cat -A

# dn153
f_a='o.aries.dn153.fa'
op_n='oa_dn.153.fa'

seqkit replace -p "^(.+?)\s.+$" -r '$1' $f_a > $op_n

# bighorn
i_d='../id/bighorn.id'
f_a='../db/o.lv.867.shortname.fa'
op_n='bighorn1.fa'

seqkit grep -f $i_d $f_a -o $op_n

# all
cat *fa > all.1104.mito
wc -l ../id/* 
grep '>' all.1104.mito | wc -l

# kk