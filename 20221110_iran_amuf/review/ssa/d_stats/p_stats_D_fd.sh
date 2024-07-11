#!/usr/bin/env bash

# lib
mamba activate dsuite
module load compiler/gcc/7.3.1

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd

# vf
run.d_fd.sel_vf.sh

# sample
sample: 85: sel.strata

## d_pop
cat men.tsv | while read p1; do
cat ssa.tsv | while read p2; do
cat o.o.tsv | while read p3; do
cat o.ca.tsv | while read p4; do
printf "%s\t%s\t%s\t%s\n"  $p1 $p2 $p3 $p4
done
done
done
done > d.trio.tsv

# awk 'BEGIN{FS="\t"; OFS="\t"} NR==FNR{a[$1]=$0; next} ($1 in a){print a[$1]} !($1 in a){print $1,"xxx"}' spe.strata 810.id > dsuite.xxx.strata

sel.strata

## nwk
cut -f2 sel.strata | uniq |\
tr '\n' ',' | sed '$ s/,$/\n/' > tree.all.nwk

# D
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/s_dtrios

run.ssa.dtrios.sh

## combine_d/filter
Dsuite DtriosCombine d_trio/dtrio.{1..26} -o op_tsv/dsuite.dtrio -t sam_ple/tree.all.nwk

cat sam_ple/d.trio.tsv | while read p1 p2 p3 p4;do
cat op_tsv/dsuite.dtrio_combined_BBAA.txt |\
grep $p1 | grep $p2 | grep $p3
done > op_tsv/dsuite.dtrio_36.txt

cat <(head -n 1 op_tsv/dsuite.dtrio_combined_BBAA.txt) op_tsv/dsuite.dtrio_36.txt > op_tsv/dsuite.ssa.tsv

# plot_d_f4
## plot D
plot.ssa.heatmap_dtrios.r

## plot f4
plot.ssa.heatmap_f4.r

# fd_m
run.ssa.dinvestigate.sh

# intro_overlap
run.ssa.dinvestigate.cb_fl.sh

# plot_venn
plot.ssa.fdm_venn.r

# anno
run_bed_anno.sh

# kk
