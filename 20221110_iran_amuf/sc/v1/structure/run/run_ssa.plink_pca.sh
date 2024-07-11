#!/usr/bin/env bash
#SBATCH -J pca.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_779

# args
b_p='iran_sheep.pr'
op_p='pca/iran_sheep'

# run
plink --bfile $b_p \
    --allow-extra-chr \
    --chr-set 26 \
    --pca \
    --out $op_p

# kk
