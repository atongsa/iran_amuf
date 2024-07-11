#!/usr/bin/env bash
#SBATCH -J v_b
#SBATCH -p xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -t 24-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/vc_f/lv_pk

# plink
for c_hr in `seq 28`
do
plink \
    --vcf sheep.810.$c_hr.bisnp.pass.vcf.gz \
    --chr-set 26 \
    --make-bed \
    --out pk.$c_hr
done

# kk
