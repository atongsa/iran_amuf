#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/pbs/pbs_filter

# args
gff_tsv='/public/home/d0202110815/at42/proj/convergency_sv/genome/vep/sheep/table/gff.gene.anno.tsv'

# sort
sort -k1,1 -k2,2n ai.tsv > ai.s.tsv
bedtools merge -i ai.s.tsv > ai.mg.tsv
sort -k1,1 -k2,2n $gff_tsv | grep -v NW | grep -v NC > sheep.gene.tsv

# run
## gene_gff
#bedtools intersect -a ai.mg.tsv -b sheep.gene.tsv -wo > anno.pbs.tsv
bedtools closest -a ai.mg.s.tsv -b sheep.gene.n2.tsv -d > anno.pbs.updn.tsv
#bedtools closest -a ai.mg.s.tsv -b sheep.gene.n2.tsv -u > anno.pbs.updn.tsv

#cut -f1,4,6,15 anno.pbs.updn.tsv > manh.pbs.anno.tsv

## qtl
grep -v "^#" qtl.bed | grep -v '^$' |\
	awk -vOFS="\t" '$2>$3{print $1,$3,$2,$4} $2<$3' | cut -f1-4 > qtl.new.bed

trait_tsv='qtl.new.bed'
bedtools intersect -a ../ai.mg.tsv -b $trait_tsv -wo > anno.ai.tsv

cut -f1,2,3,7 anno.ai.tsv | cut -f1 -d'(' | sed 's/ /_/g; s/_QTL_//' > anno.ai.simple.tsv

# ```r
# df <- read_tsv("anno.pbs.qtl.long.tsv", col_names=F)
# df_n <- df %>%
# 	#mutate(l_b=str_c(X1,"_",X4)) %>%
# 	#select(-c(1:5)) %>%
# 	pivot_wider(names_from=X6, values_from = X5)
#
# ```

## manh_anno
bedtools intersect -wa -wb \
    -a p1.pbs.all.top.simple.bed -b anno.ai.simple.tsv > manh.anno.tsv
sort -k6,6g -k8,8 -u manh.anno.tsv > manh.anno.simple.tsv
cut -f4-6,8 manh.anno.simple.tsv | awk 'BEGIN{OFS="\t"} {print $2,$3,$1,$4}'> manh.fake.tsv

# kk
