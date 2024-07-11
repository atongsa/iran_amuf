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
cd /public/home/d0202110815/at42/proj/iran_amuf/structure/snmf/v_f

# v_f
vf_810='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/pr_2_vf/m_g/pr.st.vcf.gz'

# run
bcftools view -S ../sam_ple/id.770 $vf_810 > 770.vcf
#--force-samples

# geno
vcf2geno 770.vcf

# kk
