#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/hapnet/net_4k

# args
v_f='../male_gt/ram.miss0.95.vcf.gz'

# filter
#bcftools view -i 'F_MISSING=0'  $vf_1
bcftools view -S ^false.id $v_f -Oz -o ram.vcf.gz
tabix -p vcf ram.vcf.gz

# id_label
v_f='ram.vcf.gz'
bcftools query -l $v_f > id.tsv
#awk -vFS="\t" -vOFS="\t" '{print $1,$12,$13}' ovis.sel.ram.tsv > /public/home/d0202110815/at42/proj/iran_sheep/y_chr/hapnet/ram.loc.spe.tsv
inner_join.r id.tsv id.spe.loc.tsv '"X1"' "ram.spe.loc.tsv" # 239

# impute
j_ar='/public/home/d0202110815/at42/app/beagle/beagle.22Jul22.46e.jar'
v_f='ram.vcf.gz'

java -Xmx4G -jar $j_ar gt=$v_f out=ram.ip

# vf2fa
v_f='ram.ip.vcf.gz'
vcf2phylip.py -i $v_f -m 239 -p -n -f --output-prefix 'ram.p'

# # rm; bighorn2, bighorn4
# seqkit grep -v -f false.id -n ram.y.f1.min245.fasta > ram.y.f1.min245.cl.fasta
# seqkit grep -v -f false.id -n ram.y.f5.min245.fasta > ram.y.f5.min245.cl.fasta

# kk
