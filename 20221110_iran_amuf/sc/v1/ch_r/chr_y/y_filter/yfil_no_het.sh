#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/filter

# args
v_f='no_amplicon/ram.vcf.gz'

# no_het
bcftools view -e 'GT="het"' $v_f -Oz > no_heterozygous/ram.vcf.gz
tabix -p vcf no_heterozygous/ram.vcf.gz # 4159

# kk
