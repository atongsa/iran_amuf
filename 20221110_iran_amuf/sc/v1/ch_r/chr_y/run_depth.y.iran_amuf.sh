#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_y/net_4k/depth

# run
v_f='../ram.vcf.gz' # 239

bcftools query -f '[%SAMPLE\t%DP\n]' $v_f > sp.depth
cut -f2 sp.depth | grep -v '\.' | datamash mean 1
# 17.092512025726/2; 8.54625601286300000000



# kk