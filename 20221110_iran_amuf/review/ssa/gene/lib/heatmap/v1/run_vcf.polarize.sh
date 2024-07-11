#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/hap_heatmap/polar

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/v_f/d.10.vcf.gz'
r_g='10:41205017-43073231'

# run
## sel_vf
bcftools view -r $r_g $v_f -Oz > ai_pcdh9.vcf.gz
tabix -p vcf ai_pcdh9.vcf.gz

## impute_miss
j_ar='/public/home/d0202110815/at42/app/beagle/beagle.22Jul22.46e.jar'
op_p='ai_pcdh9.phase'

java -Xmx4G -jar $j_ar gt=ai_pcdh9.vcf.gz out=$op_p
tabix -p vcf $op_p.vcf.gz

## bighorn
v_f='ai_pcdh9.phase.vcf.gz'
s_p='bighorn.id'

bcftools view -S $s_p $v_f -Oz > bighorn.vcf.gz
tabix -p vcf bighorn.vcf.gz

## bighorn_allele
plink2 --vcf bighorn.vcf.gz \
    --chr-set 26 \
    --allow-extra-chr \
    --recode vcf id-paste=iid bgz \
    --maj-ref 'force' \
    --out bighorn.major

bcftools query -f '%CHROM\t%POS\t%REF\n' bighorn.major.vcf.gz | sed 's/\t/_/'> ance.tsv

# site in ref/alt 
# keep pos
# reverse

## polarize
v_f='ai_pcdh9.phase.vcf.gz'
plink2 --vcf $v_f \
    --chr-set 26 \
    --chr 10 \
    --set-missing-var-ids @_# \
    --ref-allele force ance.tsv 2 1 \
    --recode vcf id-paste=iid bgz \
    --out ai_pchd9.polar

## ance_pcdh9_exon
awk '$3=="exon"' pcdh9.gff |\
    cut -f1,4,5 |\
    sort -k2,2n -u > pcdh9.exon.rg

v_f='../polar/ai_pcdh9.polar.vcf.gz'
r_g='pcdh9.exon.rg'
s_p='sp.id'

bcftools view $v_f -S $s_p -R $r_g > pcdh9.exon.vcf

## ai
v_f='../polar/ai_pcdh9.polar.vcf.gz'
r_g='10:41205017-41212664'
s_p='sp.id'

bcftools view $v_f -S $s_p -r $r_g > ai.vcf

# kk
