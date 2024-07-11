#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_y/net_4k/depth

# auto_depth
bcftools view -S ram.id sheep.810.25.bisnp.pass.vcf.gz --force-samples > ram.25.vcf

v_f='ram.25.vcf'
bcftools query -f '[%DP\n]' $v_f > ram.25.dp
cat ram.25.dp | grep -v '\.' | datamash mean 1 # 17.183803969601

# y
v_f='sheep.810.28.bisnp.pass.vcf.gz'
bcftools view -S ram.id $v_f --force-samples > ram.y.vcf

v_f='ram.y.vcf'
bcftools query -f '[%DP\t]\n' $v_f > ram.y.dp

cat ram.y.dp | datamash transpose > ram.t.y.dp
awk 'NR==1{print NF}' ram.t.y.dp

for i in {1..203938}
do
cut -f$i ram.t.y.dp | grep -v '\.' | sed '/^$/d' | datamash mean 1
done > ram.y.mean

for i in {1..203938}
do
cut -f$i ram.t.y.dp | grep -v '\.' | sed '/^$/d' | awk '{sum+=$1} END{print sum/NR, NR}' &
done > ram.y.mean2

# y_fil
17*0.25 < y < 17
4.25 < y < 17

awk '($1>4.25 && $1<17){print $1}' ram.y.mean > ram.y.fil.mean
datamash min 1 max 1 mean 1 < ram.y.fil.mean # 4.2510460251046	16.991631799163	8.2595755356497

cut -f1 -d' ' ram.y.mean2 | datamash min 1 max 1 mean 1

# kk
