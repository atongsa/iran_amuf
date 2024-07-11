#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/heatmap/pola_rize

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001/10.ms01_mf001.vcf.gz'

# beagel
r_g='10:41204271-43073231'
bcftools view -r $r_g $v_f -Oz > ai_pcdh9.vcf.gz
tabix -p vcf  ai_pcdh9.vcf.gz

j_ar='/public/home/d0202110815/at42/app/beagle/beagle.22Jul22.46e.jar'
op_p='ai_pcdh9.phase'

java -Xmx4G -jar $j_ar gt=ai_pcdh9.vcf.gz out=$op_p
tabix -p vcf $op_p.vcf.gz

# bighorn
v_f='../ai/ai_pcdh9.phase.vcf.gz'
s_p='bighorn.id'
r_g='10:41204271-43073231'
bcftools view -S $s_p $v_f -r $r_g > bighorn.vcf

bgzip bighorn.vcf
tabix -p vcf bighorn.vcf.gz

## ancestral_fa
ref_fa='/public/home/d0202110815/at42/proj/convergency_sv/genome/sheep_chr_num.fna'
#r_g='10:41204271-43073231'
b_vf='bighorn.vcf.gz'

samtools faidx $ref_fa 10 |\
    bcftools consensus $b_vf > chr10.ance.fa

# ance_ai
ref_fa='../bighorn/chr10.ance.fa'
v_f='ai_pcdh9.phase.vcf.gz'
r_g='10:41204271-41213804'

bcftools view $v_f -r $r_g > ai.vcf
bedtools getfasta -fi $ref_fa -bed ai.vcf | grep -v '>' > ai.vcf.ance.fa
grep -v '#' ai.vcf | cut -f1,2 | tr '\t' '_' > ai.vcf.ance.id
paste ai.vcf.ance.fa ai.vcf.ance.id > ai.pk.ref.txt

## vf2mat
plink2 --vcf ai.vcf \
    --chr-set 26 \
    --chr 10 \
    --set-missing-var-ids @_# \
    --ref-allele force ai.pk.ref.txt 1 2 \
    --recode vcf-iid \
    --out pk.ai.ance

grep '^#' pk.ai.ance.vcf | tail -n 1 > mat.ance.h
grep -v '#' pk.ai.ance.vcf > mat.ance.vcf
cat mat.ance.h mat.ance.vcf | cut -f3,10- > mat.ance.tsv

sed 's/\//|/g; s/|/+/g' mat.ance.tsv > mat.ance.1.tsv

datamash transpose < mat.ance.1.tsv > mat.ance.1t.tsv

# ance_pcdh9_exon
## rg
awk '$3=="exon"' pcdh9.gff | cut -f1,4,5 | sort -k2,2n -u > pcdh9.exon.rg

## ance
v_f='../ai/ai_pcdh9.phase.vcf.gz'
ref_fa='../bighorn/chr10.ance.fa'
r_g='pcdh9.exon.rg'

bcftools view $v_f -R $r_g > pcdh9.exon.vcf
bedtools getfasta -fi $ref_fa -bed pcdh9.exon.vcf | grep -v '>' > pcdh9.exon.vcf.ance.fa
grep -v '#' pcdh9.exon.vcf | cut -f1,2 | tr '\t' '_' > pcdh9.exon.vcf.ance.id
paste pcdh9.exon.vcf.ance.fa pcdh9.exon.vcf.ance.id > pcdh9.exon.pk.ref.txt

## mat
plink2 --vcf pcdh9.exon.vcf \
    --chr-set 26 \
    --chr 10 \
    --set-missing-var-ids @_# \
    --ref-allele force pcdh9.exon.pk.ref.txt 1 2 \
    --recode vcf-iid \
    --out pk.pcdh9.exon.ance

grep '^#' pk.pcdh9.exon.ance.vcf | tail -n 1 > mat.ance.h
grep -v '#' pk.pcdh9.exon.ance.vcf > mat.ance.vcf
cat mat.ance.h mat.ance.vcf | cut -f3,10- > mat.ance.tsv

sed 's/\//|/g; s/|/+/g' mat.ance.tsv > mat.ance.1.tsv

datamash transpose < mat.ance.1.tsv > mat.ance.1t.tsv

# kk
