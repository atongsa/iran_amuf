#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/sample_info

# rp
find_replace.py sp.tsv kv.id #sp.vcf.tsv
mv sp.tsv.kv.at sp.vcf.tsv

inner_join.r sp.tsv kv.id 'c("X1"="X1")' "sp.vcf.all.tsv"

# loc_spe
left_join.r sp.810.nid.sex.tsv iran_sheep.loc.spe.tsv 'c("X1"="X1")' "sp.810.nid.sex.loc.spe.tsv"

# select_species
inner_join.r sp.810.nid.sex.tsv spe.ls 'c("X2"="X1")' 'iran_sheep.tsv' # 779

# ewe/ram
f_l='ovis.sel.tsv'
awk -vFS="\t" -vOFS="\t" '$11=="female"' $f_l > ovis.sel.ewe.tsv
awk -vFS="\t" -vOFS="\t" '$11=="male"' $f_l > ovis.sel.ram.tsv # | less -S

# kk
