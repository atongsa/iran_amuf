#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/vc_f/iran_sheep

# plink
plink \
    --merge-list pk.ls \
    --chr-set 26 \
    --make-bed \
    --out m_g/iran_sheep.pr

# bcftools
bcftools concat -f vcf.ls -Oz -o m_g/iran_sheep.pr.vcf.gz
tabix -p vcf m_g/iran_sheep.pr.vcf.gz

# kk
