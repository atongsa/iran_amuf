#!/usr/bin/env bash
#SBATCH -J o.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/vc_f/iran_sheep

# args
ch_r=at42_id

# b2v
for ch_r in `seq 28`
do
plink \
    --bfile pru_ne/pr.o.$ch_r \
    --chr-set 26 \
    --recode vcf-iid bgz \
    --out b2v/$ch_r
tabix -p vcf b_2_v/$ch_r.vcf.gz
done

# kk
