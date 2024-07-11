#!/usr/bin/env bash
#SBATCH -J f.o.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/vc_f

# args
c_hr=at42_id
i_d='/public/home/d0202110815/at42/proj/iran_sheep/sample_info/iran_sheep.fam.ind.id'

# plink
plink \
    --bfile lv_pk/pk.$c_hr \
    --keep $i_d \
    --chr-set 26 \
    --geno 0.1 \
    --maf 0.05 \
    --make-bed \
    --out iran_sheep/filter/$c_hr

#--maf 0.01 \
#--keep pk.iran.id \

# kk
