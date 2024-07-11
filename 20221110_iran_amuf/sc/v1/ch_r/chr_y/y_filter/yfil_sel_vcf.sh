#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/filter

# args
v_f='sheep.810.28.bisnp.pass.vcf.gz'
ewe_id='ewe.id'
ram_id='ram.id'

# sel_vcf
#bcftools view -S $ewe_id --min-ac=1 $v_f > ewe.vcf
bcftools view -S $ram_id --min-ac=1 $v_f > ram.vcf

# pi_low
# v_f='v_f/ram.vcf.gz'
# vcftools --gzvcf $v_f --window-pi 1000000 --window-pi-step 10000 --out pi_low/ram_pi_ref
#
# v_f='no_amplicon/ram.vcf.gz'
# vcftools --gzvcf $v_f --window-pi 1000000 --window-pi-step 10000 --out pi_low/ram_pi_noamp

# kk
