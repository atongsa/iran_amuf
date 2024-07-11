#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/ld

# tag_snp
cd tag

v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001/10.ms01_mf001.vcf.gz'

plink --vcf $v_f \
    --chr-set 26 \
    --chr 10 \
    --set-missing-var-ids @_# \
    --make-bed \
    --out pk.chr10

plink --bfile pk.chr10 \
    --chr-set 26 \
    --chr 10 \
    --from-bp 41104271 \
    --to-bp 43073231 \
    --set-missing-var-ids @_# \
    --indep-pairwise 100 10 0.4 \
    --out pk.chr10.ai_pchd9

plink --bfile pk.chr10 \
    --allow-extra-chr \
    --chr-set 26 \
    --chr 10 \
    --from-bp 41104271 \
    --to-bp 43073231 \
    --set-missing-var-ids @_# \
    --extract pk.chr10.ai_pchd9.prune.in \
    --make-bed \
    --out pk.pr.chr10.ai_pchd9


ref_fa='/public/home/d0202110815/at42/proj/convergency_sv/genome/sheep_chr_num.fna'

plink2 \
    --ref-from-fa $ref_fa \
    --bfile pk.pr.chr10.ai_pchd9 \
    --autosome-num 26 \
    --recode vcf-iid bgz \
    --out pk.pr.chr10.ai_pchd9

# gff
10 Gnomon UTR 41204271 41213804
10 Gnomon CDS 41893112 43073231

#CDS:Intron:UTR:Intergenic

# cal_block
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/ld

v_f='tag/pk.pr.chr10.ai_pchd9.vcf.gz'
#b_f='tag/pk.pr.chr10.ai_pchd9'
op_p='ai.10k'
r_g='10:41194271-41903112' # '10:41194271-41903112'/ai_pcdh9
po_p='pop/br_3.id'
gf_f='gff/ai.pcdh9.zoom.gff'

LDBlockShow -InVCF $v_f -OutPut $op_p -Region $r_g -SeleVar 2 -SubPop $po_p # -InVCF $v_f; -SubPop $po_p; -InPlink $b_f

# show
ShowLDSVG -InPreFix $op_p -OutPut $op_p.n.svg -crGene yellow:white:red:white -OutPdf -OutPng -NoShowLDist 2000000

#-InGFF $gf_f
# haploview

# association
https://github.com/KosukeHamazaki/RAINBOWR

# kk
