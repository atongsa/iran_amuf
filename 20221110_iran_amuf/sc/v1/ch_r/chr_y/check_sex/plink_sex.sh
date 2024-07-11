#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/sex

# args
b_f='pru_ne/pr.sel.sex.bi.filter.vcf'
op_split='split_x/sex.split'

op_p='sex.check'

# merge_bed
bcftools concat -f vcf.ls -Oz -o sex.vcf.gz
vcftools --gzvcf sex.vcf.gz --max-missing 0.75 --maf 0.01 --recode --out sex.filter
bcftools view -m2 -M2 sex.filter.vcf.recode.vcf > sex.bi.filter.vcf

# split_x
plink --bfile $b_f \
--chr-set 26 \
--split-x 20000000 100000000 \
--make-bed \
--out $op_split

# plink
plink --bfile $op_split \
--chr-set 26 \
--check-sex --out $op_p

plink --bfile $op_split \
--chr-set 26 \
--check-sex 0.3 0.6 --out $op_p.bd

# plot
ggplot(df, aes(X1)) + geom_histogram() # 0.6

# tsv
d_f='sex.check.bd.sexcheck'

cat $d_f | tr -s ' ' | sed 's/^ //' |\
sed 's/ /\t/g' |\
awk 'BEGIN{OFS="\t"} {print $1,$4,$6}' |\
awk 'BEGIN{OFS="\t"} $2==0{print $1,$2,$3,"NA"} $2==1{print $1,$2,$3,"male"} $2==2{print $1,$2,$3,"female"}' > sex.810.tsv

# kk
