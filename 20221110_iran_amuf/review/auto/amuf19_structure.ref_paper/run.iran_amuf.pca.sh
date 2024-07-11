#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/iroo_structure

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/review/iroo_structure/iroo.genus.snp.oar3.lv.vcf.gz'

# vf2pk
plink --vcf $v_f \
    --chr-set 26 \
    --allow-extra-chr \
    --chr 14 \
    --geno 0.01 \
    --maf 0.05 \
    --make-bed \
    --out iroo.fl.14

# pca
plink --bfile ../fl/iroo.fl.14 \
    --allow-extra-chr \
    --autosome-num 14 \
    --pca \
    --out chr14

# plot
plot.iran_amuf.pca.r

# kk