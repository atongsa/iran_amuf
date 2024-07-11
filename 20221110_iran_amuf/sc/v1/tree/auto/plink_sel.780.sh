#!/usr/bin/env bash
#SBATCH -J at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 1-00:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_780

# args
pk_p='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_pk'
ch_r=at42_id

# sp
plink --bfile $pk_p/pk.$ch_r \
    --allow-extra-chr \
    --chr-set 26 \
    --chr $ch_r \
    --keep pk.id \
    --make-bed \
    --out pk_780.$ch_r

# kk
