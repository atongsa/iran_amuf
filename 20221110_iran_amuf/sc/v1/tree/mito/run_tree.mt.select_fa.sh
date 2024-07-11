#!/usr/bin/env bash

# select_fa
mito.bam.depth.sh

awk '$2 > 100' mito.depth.tsv > mito.depth.100.tsv
inner_join.r select.id mito.depth.100.tsv '"X1"' mito.depth.100.amuf.urial.sheep.tsv

# make_fa
cd /public/home/d0202110815/at42/proj/iran_sheep/ana/phylo/mito/mito_fa

for f in *.f*
do
echo $f
grep '>' $f | sed 's/>//' > i_d/$f.id
done

# kk
