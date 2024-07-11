#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene

# ai_region
run_ai_anno_oar1.sh

# select_region
10:41893112-43073231 # pcdh9
10:41204271-41213804 # 9533;ai
10:41194271-41223804 # 9533_ud_10k

# plot_region
b_d='v.bed'
gff='/public/home/d0202110815/at42/proj/convergency_sv/genome/vep/sheep/oar1_num.gff.sort'

bedtools intersect -a $b_d -b $gff -wb | cut -f4- | awk '$3=="exon"' > pcdh9.gff

# haploblock
'10:41184271-41313804' # up:20k, dn:100k

run_ld.sh

# dxy/fst
run_pixy.sh

plot_pixy.r
plot_pixy_dxy_fst.r
plot_gene.r
plot_combine_pixy.r

# heatmap
plot_heatmap.introgression.r

# hapnet
run_hapnet.ai.sh
run_hapnet.ai.r

# kk
