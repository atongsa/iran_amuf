#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/o_v

# overlap
bedtools intersect -a p1.pbs.all.top.bed -b fdm.bed -wo > a_b.bed # both_reg
bedtools intersect -a p1.pbs.all.top.bed -b fdm.bed > ab_over.bed # inter_reg
inner_join.r ab_over.bed a_b.bed 'c("X1", "X4")' ab_over_a_b.bed

sort -k1,1 -k2,2n ab_over_a_b.bed > ai.all.bed
#bedtools sort -i ab_over_a_b.bed > ai.all.st.bed

cut -f1-3 ai.all.bed > ai.reg.bed

# merge
bedtools merge -i ai.reg.bed > ai.reg.mg.bed
cp ai.reg.mg.bed ai.r1.bed

# st
sort -k1,1 -k2,2n ai.r1.bed > ai.r1.st.bed

# oar1_gene_tsv
# awk '$3=="gene"' GCF_016772045.1_ARS-UI_Ramb_v2.0_genomic.gff > gene.tsv
# find_replace.py gene.tsv kv.id

#sort -k1,1 -k4,4n gene.tsv.kv.at > oa_r2.gene.tsv

# anno
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/anno_oar1

bed_p='../o_v/ai.r1.st.bed'
gff_tsv='/public/home/d0202110815/at42/proj/convergency_sv/genome/vep/sheep/table/gene.st.tsv'

# no_loc
grep -v LOC $gff_tsv > gene.tsv

# over_gff
bedtools intersect -a $bed_p -b $gff_tsv -wo > anno.gene.tsv

bedtools closest -a $bed_p -b gene.tsv -d > anno.gene.close.tsv
cut -f1-3,7-9,11 anno.gene.close.tsv > anno.gene.close.simple.tsv

#bedtools window -w 1000000 -a $bed_p -b n.tsv

# over_qtl
bedtools intersect -a ai.r1.bed -b qtl.new.bed -wo > anno.qtl.tsv

# over_qtl_gff
inner_join.r anno.gene.close.simple.tsv anno.qtl.tsv 'c("X1","X2")' gene.qtl.tsv

cut -f1,2,3,6,7,12 gene.qtl.tsv | sort -u -k1,1V -k2,2n -k6,6 > gene.qtl.simple.tsv

# kk
