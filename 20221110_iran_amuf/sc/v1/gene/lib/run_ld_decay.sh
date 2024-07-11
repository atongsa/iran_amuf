#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/ld_decay

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001/10.ms01_mf001.vcf.gz'
s_p='sam_ple/id.ls'

# run
## ssa_in.vcf
ai_pcdh9_vf='v_f/chr10.ai_pcdh9.vcf'
r_g='10:41204271-42014112' # ai_to_gene_end; 800k

#echo 41213804-41914112 | bc -l

bcftools view $v_f -r $r_g > $ai_pcdh9_vf
PopLDdecay -InVCF $ai_pcdh9_vf -MaxDist 800 -OutStat cal_c/ai_pcdh9.ssa_in.stat.gz -SubPop $s_p

## decay_chr10
PopLDdecay -InVCF $v_f -MaxDist 800 -OutStat cal_c/chr10.ssa_in.stat.gz -SubPop $s_p

# kk
