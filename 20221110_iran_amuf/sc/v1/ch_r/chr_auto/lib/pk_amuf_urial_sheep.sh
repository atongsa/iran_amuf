#!/usr/bin/env bash
#SBATCH -J f_l
#SBATCH -p xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -t 24-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/vc_f/lv_amuf_urial_sheep

# plink
for c_hr in `seq 26`
do
plink \
    --bfile ../lv_pk/pk.$c_hr \
    --autosome-num 26 \
    --keep pk.iran.id \
    --geno 0.1 \
    --mac 1 \
    --make-bed \
    --out amuf.$c_hr
done

#--maf 0.01 \

# kk
