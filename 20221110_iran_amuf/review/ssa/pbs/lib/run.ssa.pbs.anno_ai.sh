#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs/anno/ai

# args
sig_f='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs/sig/top1.pbs.all.st.bed'

gff_tsv='/public/home/d0202110815/at42/proj/convergency_sv/genome/vep/sheep/table/gff.gene.anno.tsv'

fd_top5_over='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/d_inves/venn/top_bed/ssa_4_fd_overlap.4.tsv'

# fd_mg
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/pbs/anno/ai
bedtools merge -i $fd_top5_over > fd.mg.tsv

# pbs_mg
bedtools merge -i $sig_f > pbs.mg.bed # 2677

# ai
bedtools intersect -a pbs.mg.tsv -b fd.mg.tsv -sorted -g sheep.len.genome > ai.tsv

# ai_gene
sort -k1,1g -k2,2n $gff_tsv | grep -v NW | grep -v NC | cut -f1,2,3,5,8 > gff.gene.tsv

grep -v LOC gff.gene.tsv > gff.gene.tsv2

bedtools closest -g sheep.len.genome -a pbs.fd.pos.tsv -b gff.gene.tsv2 -d > pbs.fd.pos.closest.tsv # 680,448

cut -f8 $s_pe.anno.tsv | sort -u > $s_pe.anno.gene.id

# ai_qtl
grep -v "^#" qtl.bed | grep -v '^$' |\
	awk -vOFS="\t" '$2>$3{print $1,$3,$2,$4} $2<$3' | cut -f1-4 > qtl.new.bed

trait_tsv='qtl.new.bed'
bedtools intersect -a ../ai.tsv -b $trait_tsv -wo > anno.ai.tsv

cut -f1,2,3,7 anno.ai.tsv | cut -f1 -d'(' | sed 's/ /_/g; s/_QTL_//' > anno.ai.simple.tsv

# manh
## manh_anno
bedtools intersect -wa -wb \
    -a pbs.mg.bed -b ../qtl/anno.ai.simple.tsv > manh.anno.tsv
sort -k1,1g -k2,2n -k7,7 -u manh.anno.tsv | cut -f1,2,7 > manh.anno.simple.tsv

#choose represent 5 qtl show

# kk