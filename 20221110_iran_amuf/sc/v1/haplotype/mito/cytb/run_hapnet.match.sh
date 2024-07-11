#!/usr/bin/env bash

# match_fa
seqkit replace -p '(.*)' -r '{kv}' -k kv.id2 cytb.fa > cytb.2.fa

f_a='cytb.2.fa'
cat sel.id.2 | while read i_d
do
seqkit grep -p $i_d -n $f_a
done > sel.fa

# match_strata
inner_join.r sel.id.2 sp.strata '"X1"' "sp.st.strata"
awk 'BEGIN{FS="\t"; OFS="\t"} NR==FNR{a[$1]=$0; next} ($1 in a){print a[$1]}' sp.st.strata2 sel.id.2 > sp.st.strata3

# strata_rn
find_replace.py sp.st.strata4 kv.id4 # long2short
find_replace.py sp.st.strata4.kv.at kv.id5
grep NA sp.st.strata4.kv.at.kv.at

# kk
