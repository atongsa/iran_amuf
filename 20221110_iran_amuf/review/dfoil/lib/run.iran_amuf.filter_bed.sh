#!/usr/bin/env bash

#cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/v_f

#args
sel_id='/public/home/d0202110815/at42/proj/iran_amuf/review/dfoil/s_p/'

bd_p='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_pk'

for f in {1..26}
do
plink --bfile $bd_p/pk.$f \
    --keep $sel_id/sel.keep.pk \
    --chr-set 26 \
    --allow-extra-chr \
    --set-missing-var-ids @_# \
    --geno 0.01 --maf 0.05 \
    --make-bed \
    --out sel.$f

# plink --bfile sel.$f \
# --chr-set 26 \
# --allow-extra-chr \
# --set-missing-var-ids @_# \
# --indep-pairwise 50 10 0.1 \
# --out $f.site

# plink --bfile sel.$f \
# --chr-set 26 \
# --allow-extra-chr \
# --set-missing-var-ids @_# \
# --extract $f.site.prune.in \
# --make-bed \
# --out pr.$f

done

plink \
    --merge-list sel.ls \
    --chr-set 26 \
    --make-bed \
    --out ../sel49.fl

plink \
    --bfile sel49.fl \
    --chr-set 26 \
    --recode vcf-iid bgz \
    --out sel49.fl1

bcftools view -R ../r_g/ov.4.bed sel49.fl1.vcf.gz -Oz -o sel49.fl1.rg.vcf.gz

#kk