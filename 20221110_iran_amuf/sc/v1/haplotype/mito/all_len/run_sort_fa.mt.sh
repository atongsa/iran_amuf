#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/hap_net/mito/all_len/fa

# filter_ma.fa/sort_fa
seqkit grep -f sel.id -n o.926.trim.fa > sel.fa

f_a='mt.hap.fa'
snp-sites -c -v $f_a -o sel.fa.vcf # no_gap/only_acgt; -c
grep -v '#' sel.fa.vcf | cut -f1,2,5 | sed 's/,/\t/' | awk '$4==""' > sel.pos.1 # only two allele
#cut -f3 sel.pos.1 | sort -u # M/R
#awk 'NR==FNR{a[$1];next} !($3 in a){print $0}' de.id sel.pos.1 > sel.pos.2 # no mix_base

vcftools --vcf sel.fa.vcf --positions sel.pos.1 --out sel.fa.good.vcf --recode
# bgzip sel.fa.good.vcf.recode.vcf
# tabix -p vcf sel.fa.good.vcf.recode.vcf.gz
# bcftools view -S sel.id sel.fa.good.vcf.recode.vcf.gz > sel.st.vcf
vcf2phylip.py -f -i sel.fa.good.vcf.recode.vcf #

f_a='sel.fa.good.min4.fasta'
i_d='mt.hap.id'
cat $i_d | while read i_d
do
seqkit grep -p $i_d -n $f_a
done > sel.st.fa

sed -n '44,49p' $i_d
grep '>' sel.st.fa | sed -n '44,49p'

# kk
