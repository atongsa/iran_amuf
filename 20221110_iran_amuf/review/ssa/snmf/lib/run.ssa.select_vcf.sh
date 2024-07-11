#!/usr/bin/env bash
#SBATCH -J o.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/admixture

# id
vim ex.id
IROO-F5-5079
IROO-C3-0001
IROO-E3-5492
TH.1
TH.2

# sel
bcftools view -S ^ex.id ssa.vcf > ssa.m5.vcf

# kk