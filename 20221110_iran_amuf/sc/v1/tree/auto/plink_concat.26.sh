#!/usr/bin/env bash
#SBATCH -J cat
#SBATCH -p xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_780/filter

# list
seq 26 | xargs -I n_m echo "fl."n_m > merge.ls

plink \
    --merge-list merge.ls \
    --chr-set 26 \
    --make-bed \
    --out ../m_g/mg.780

# kk
