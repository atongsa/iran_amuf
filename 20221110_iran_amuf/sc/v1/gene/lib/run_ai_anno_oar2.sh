#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/o_v

# overlap
bedtools intersect -a p1.pbs.all.top.bed -b fdm.bed -wo > a_b.bed
bedtools intersect -a p1.pbs.all.top.bed -b fdm.bed > ab_over.bed
inner_join.r ab_over.bed a_b.bed 'c("X1", "X4")' ab_over_a_b.bed

sort -k1,1 -k2,2n ab_over_a_b.bed > ai.all.bed
#bedtools sort -i ab_over_a_b.bed > ai.all.st.bed

cut -f1-3 ai.all.st.bed > ai.reg.bed

# oar2_gene_tsv
awk '$3=="gene"' GCF_016772045.1_ARS-UI_Ramb_v2.0_genomic.gff > gene.tsv
find_replace.py gene.tsv kv.id

sort -k1,1 -k4,4n gene.tsv.kv.at > oa_r2.gene.tsv

# anno
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/anno

bed_p='../o_v/ai.r2.bed'
gff_tsv='oa_r2.gene.tsv'

# over_gff
bedtools intersect -a $bed_p -b $gff_tsv -wo > anno.gene.tsv

bedtools closest -a $bed_p -b $gff_tsv -d > anno.gene.close.tsv
cut -f1-3,7,8,12- anno.gene.close.tsv > anno.gene.close.simple.tsv

#bedtools window -w 1000000 -a $bed_p -b n.tsv

# over_qtl
bedtools intersect -a ai.r2.bed -b qtl.new.bed -wo > anno.qtl.tsv

# over_qtl_gff
inner_join.r close.gene.simple.tsv ov.anno.qtl.tsv 'c("X1","X2")' gene.qtl.tsv

#cut -f1-6,10-11 gene.qtl.tsv | cut -f7 | sort -u

grep 'bone' gene.qtl.tsv # PCDH9
grep 'fat' gene.qtl.tsv # PCDH9

# kk
