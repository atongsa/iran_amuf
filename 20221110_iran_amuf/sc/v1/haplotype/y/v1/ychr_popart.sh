#!/usr/bin/env bash

# nexus
cat hp_id_sel.tsv | while read i_d; do sed -n "${i_d} p" id.tsv; done > sel.id
awk -vFS="\t" -vOFS="\t" '{print $1,NR}' sel.id > sel.id.kv
seqkit grep -f sel.id  > sel.fa










# kk
