#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/ana/phylo/mito/ref_mito5

# args
r_g=ref.mito.id

# select_fa
cat $r_g |\
while read accn #start stop
do
efetch -db nuccore -id $accn -format fasta #-seq_start $start -seq_stop $stop
done > $r_g.fa

# kv.id
awk '{print $1".1\t"$2}' kv.id > kv.id.1

# rename_fa
seqkit replace -p '(^[^\s]+)' -r '{kv}' -k kv.id.1 ref.mito.id.fa |\
seqkit replace -p "\s.+$" > ref.mito.hap.fa

#

# kk
