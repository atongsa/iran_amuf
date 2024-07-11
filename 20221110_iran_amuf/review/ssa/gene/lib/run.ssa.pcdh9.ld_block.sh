#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/ld_block

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/v_f/d.10.vcf.gz'
s_p='id.ls'
r_g='10:41185017-41913112'

ai_pcdh9_vf='pcdh9.ld_blk.vcf'
op_p='ai_pcdh9.ssa4.ldblk'
gf_f='fake.gff'

# run
## ssa4.vcf
bcftools view $v_f -S $s_p -r $r_g -i 'F_MISSING < 0.01 & MAF > 0.05'> $ai_pcdh9_vf

bcftools +prune -m 0.8 -w 1000 $ai_pcdh9_vf > pr.vcf

## vim gff
10	maker	UTR	41205017	41212664	.	+	2	ID=pcdh9
10	maker	CDS	41893112	41913112	.	+	2	ID=pcdh9

## blk
LDBlockShow -InVCF pr.vcf -OutPut $op_p -Region $r_g -SeleVar 2 -SubPop $s_p -InGFF $gf_f

## plo_blk
ShowLDSVG -InPreFix $op_p -OutPut $op_p.v1 -InGFF $gf_f \
-crGene "red:white:purple:white" \
-ShowNum  \
-crTagSNP 0,0,0 \
-crBegin 84,178,232 \
-crMiddle 232,230,84 \
-crEnd 232,84,101 \
-OutPdf \
-OutPng

#-SpeSNPName $snp_s -PointSize 2

# ## decay_chr10
# PopLDdecay -InVCF $v_f -MaxDist 800 -OutStat cal_c/chr10.ssa_in.stat.gz -SubPop $s_p

# kk
