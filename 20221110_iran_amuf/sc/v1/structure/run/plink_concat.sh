#!/usr/bin/env bash
#SBATCH -J cat
#SBATCH -p xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public1/home/casdao/kdylvfenghua/kdyatongsa1/proj/p_thesis/amuf_roh/amuf_structure/vf_concat

# list
seq 26 | xargs -I n_m echo "../vcf_prune/pr.amuf."n_m > merge.ls

plink \
    --merge-list merge.ls \
    --autosome-num 26 \
    --make-bed \
    --out amuf.pr

# kk
