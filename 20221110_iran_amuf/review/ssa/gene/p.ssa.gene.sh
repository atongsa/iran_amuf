#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene

# select_region
10:41205017-41212664 # 7647;ai
10:41893112-43073231 # pcdh9
10:6596843-74214486 # qtl
10:1-97206448 # chr10

# plot_gene
vim plot.gene.tsv
Chr10  AI 41205017  41212664 forward          1
Chr10  PCDH9 41893112   43073231 forward          1
Chr10  QTL 6596843  74214486 forward          1
CHr10   Chr10   1   97206448    forward 1

plot.ssa.pcdh9.r

# plot_pbs_fdm
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/pbs_fdm

fdm_p='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/d_inves/c_b'
pbs_p='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs/sig/pbs.all.tsv' # X6/pbs1

cut -f1-3,6 $fdm_p/BGE.tsv > bge.sp.tsv
cut -f1-3,6 $fdm_p/GUR.tsv > gur.sp.tsv
cut -f1-3,6 $fdm_p/NES.tsv > nes.sp.tsv
cut -f1-3,6 $fdm_p/SUM.tsv > sum.sp.tsv

cut -f1,2,4,6 $pbs_p > pbs.sp.tsv

for f in *
do
g_p=${f}
awk -vg_p=$g_p 'BEGIN{OFS="\t"} NR!=1{print $0,g_p}' $f
done > ../all.tsv

grep -v 'Chr\|chr' all.tsv > all.bed

vim gp.lv
pbs/bge/gur/nes/sum

vim rg.bed
10:41135107-41282664

bedtools intersect -wa -wb -a all.bed -b rg.bed > rg.pbs.fdm.bed
# grep -C 25 41205017 all.bed | cut -f1,4,6 > plot.pbs.tsv # if site cal/ but this windows not use this check

plot.ssa.line.pbs_f_dm.r

# ld_block
#rg: 20k ai pcdh9 20k

vim rg.bed
10:41135017-41282664

run.ssa.pcdh9.ld_block.sh

# ld_decay
run.ssa.ld_decay.sh
plot.ssa.ld_decay.r

# Dxy/Fst
run.ssa.pixy.sh
plot.ssa.pixy.r
plot.ssa.plot_pixy_dxy_fst.r

# heatmap of haplotype
run_vcf.polarize.sh
run.ssa.vf2hapnum.ai.sh
run.ssa.vf2hapnum.exon.sh
plot.ssa.ai.heatmap.r
plot.ssa.exon.heatmap.r

# kk
