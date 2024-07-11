#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se/sp_100

# legend
bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\tSNP\n' ph.ssa.chr1.vcf.gz | bgzip -c > chr.legend.gz

# kk
