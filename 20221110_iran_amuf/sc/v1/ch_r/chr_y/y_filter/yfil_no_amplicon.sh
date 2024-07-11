#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/filter

# sel_region
v_f='depth/ram.fil_dp.vcf.gz'
bcftools view $v_f -r 28:1-9520980 -Oz -o no_amplicon/ram.vcf.gz
tabix -p vcf no_amplicon/ram.vcf.gz

# kk
