#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/heatmap/snp_df

## ai_snp_df
bf_p='/public/home/d0202110815/at42/proj/iran_amuf/gene/ld/tag'
op_p='pk.ai.geno_num'

plink --bfile $bf_p/pk.chr10 \
--chr-set 26 \
--chr 10 \
--from-bp 41204271 \
--to-bp 41213804 \
--set-missing-var-ids @_# \
--recodeA \
--out $op_p

cut -f1,7- -d' ' pk.ai.geno_num.raw > ai.df.space.tsv

## pcdh9
bf_p='/public/home/d0202110815/at42/proj/iran_amuf/gene/ld/tag'
op_p='pk.pcdh9.geno_num'

plink --bfile $bf_p/pk.chr10 \
--chr-set 26 \
--chr 10 \
--from-bp 41893112 \
--to-bp 43073231 \
--set-missing-var-ids @_# \
--recodeA \
--out $op_p

cut -f1,7- -d' ' pk.pcdh9.geno_num.raw > pcdh9.df.space.tsv

## pcdh9_exon_df
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001/10.ms01_mf001.vcf.gz'
r_g='pcdh9.exon.rg'
op_p='pk.pcdh9_exon.geno_num'

bcftools view $v_f -R $r_g > pcdh9.exon.vcf

plink --vcf pcdh9.exon.vcf \
--chr-set 26 \
--chr 10 \
--set-missing-var-ids @_# \
--recodeA \
--out $op_p

cut -f1,7- -d' ' pk.pcdh9_exon.geno_num.raw > pcdh9_exon.df.space.tsv

# kk
