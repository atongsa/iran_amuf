#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/structure/tree

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_vcf/a_t/sheep.810.14.bisnp.pass.vcf.gz'

# select
bcftools view -S sel.id $v_f > sel.vf

# fl_prune
bcftools view -i 'F_MISSING < 0.01 & MAF > 0.05' sel.vf -Oz -o sel.fl.vf.gz

bcftools +prune -m 0.1 -w 1000kb sel.fl.vf.gz -o sel.pr.vf

# vf2fa
vcf2phylip.py -i sel.pr.vf -f

# kk









# kk