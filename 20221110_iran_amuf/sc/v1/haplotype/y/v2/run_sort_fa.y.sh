#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/hap_net/chr_y/fa

# sel
seqkit grep -f sel.id -n ram.p.min239.fasta > sel.fa

# filter
f_a='sel.fa'
snp-sites -v $f_a -o sel.fa.vcf
grep -v '#' sel.fa.vcf | cut -f1,2,5 | sed 's/,/\t/' | awk '$4==""' > sel.pos.1 # no gap
cut -f3 sel.pos.1 | sort -u # M/R
awk 'NR==FNR{a[$1];next} !($3 in a){print $0}' de.id sel.pos.1 > sel.pos.2 # no mix_base

vcftools --vcf sel.fa.vcf --positions sel.pos.2 --out sel.fa.good.vcf --recode
# bgzip sel.fa.good.vcf.recode.vcf
# tabix -p vcf sel.fa.good.vcf.recode.vcf.gz
# bcftools view -S sel.id sel.fa.good.vcf.recode.vcf.gz > sel.st.vcf
vcf2phylip.py -f -i sel.fa.good.vcf

# sort
f_a='sel.fa'
cat sel.id | while read i_d
do
seqkit grep -p $i_d -n $f_a
done > sel.st.fa

sed -n '44,49p' sel.id
grep '>' sel.st.fa | sed -n '44,49p'

# kk
