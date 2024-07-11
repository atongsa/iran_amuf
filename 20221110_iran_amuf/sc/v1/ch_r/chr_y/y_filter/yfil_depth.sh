#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/filter/depth/

# args
vf_ram='/public/home/d0202110815/at42/proj/iran_sheep/y_chr/filter/v_f/ram.vcf.gz'
vf_ewe='/public/home/d0202110815/at42/proj/iran_sheep/y_chr/filter/v_f/ewe.vcf.gz'
vf_chr1='/public/home/d0202110815/at42/proj/iran_sheep/vc_f/lv_vcf/a_t/sheep.810.1.bisnp.pass.vcf.gz'

# recode_DP
bcftools +fill-tags $vf_ram -Ob -o ram.1.bcf -- -t 'DP:1=int(sum(FORMAT/DP))'
#bcftools +fill-tags $vf_ewe -Ob -o ewe.1.bcf -- -t 'DP:1=int(sum(FORMAT/DP))'

# count_chr_1
bcftools query -f '%CHROM\t%POS\t%DP\n' $vf_chr1 > chr1.dp.tsv
awk '{sum+=$3} END{print sum/NR, NR}' chr1.dp.tsv # 13306.9 13116034

13307/2*0.5 < n < 13307/2*1.5
3327 < n < 9980

# filter_dp
bcftools filter -i 'INFO/DP > 3327 & INFO/DP < 9980' ram.1.bcf -Oz -o ram.fil_dp.vcf.gz

# kk
