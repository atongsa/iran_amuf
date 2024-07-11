#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/gene/hapnet/fa_2

# ai_vcf
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001/10.ms01_mf001.vcf.gz'

r_g='10:41204271-41213804'

bcftools view -r $r_g $v_f > sel.vcf

# phase
j_ar='/public/home/d0202110815/at42/app/beagle/beagle.22Jul22.46e.jar'
v_f='sel.vcf'
op_p='sel.phase'

java -Xmx4G -jar $j_ar gt=$v_f out=$op_p

# sel_sp
v_f='sel.phase.vcf.gz'
s_p='sel.id.2'

bcftools view -S $s_p $v_f > sel.sp.vcf
#| bcftools view -e 'GT="het"' > sel.hom.vcf

# hap
bcftools query -l sel.sp.vcf > id.ls

ref_fa='/public/home/d0202110815/at42/proj/iran_amuf/genome/chr_auto/sheep_chr_num.fna'
r_g='10:41204271-41213804'
v_f='sel.sp.vcf.gz'

cat id.ls | while read sp
do
samtools faidx $ref_fa $r_g |\
bcftools consensus -s $sp -H 1 $v_f |\
seqkit replace -p ^.*$ -r $sp.1
samtools faidx $ref_fa $r_g |\
bcftools consensus -s $sp -H 2 $v_f |\
seqkit replace -p ^.*$ -r $sp.2
done > ai.hap.fa

snp-sites -v -o ai.hap.vcf.vcf ai.hap.fa
vcf2phylip.py -i ai.hap.vcf.vcf -f

# id.strata
grep '>' ai.hap.fa | sed 's/>//' > ai.hap.id
sed 's/\.1$//; s/\.2$//' ai.hap.id > ai.hap.og.id  # this will remove twice
paste ai.hap.og.id ai.hap.id > ai.hap.og_new.id

awk 'BEGIN{FS="\t"; OFS="\t"} NR==FNR{a[$1]=$2; next} ($1 in a){print $0, a[$1]}' sel.id ai.hap.og_new.id > ai.hap.og_new.strata

#seqkit grep -f sel.fa.id ai.hap.fa > sel.ai.hap.fa

# vf2df
v_f='ai.hap.vcf.vcf'
grep -v '##' $v_f | cut -f2,10- > vf.tsv #| less -S

# kk
