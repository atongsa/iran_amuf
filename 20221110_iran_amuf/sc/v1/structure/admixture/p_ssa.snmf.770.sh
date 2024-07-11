#!/usr/bin/env bash
#SBATCH -J o.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 6
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/structure/snmf

# v_f
vf_810='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/pr_2_vf/m_g'

# select_vcf_770
run_snmf.select_vcf.sh

# run_admix
run_snmf.770.sh
grep "Cross-Entropy (masked data):" *.log | sort -k4n # k13

# plot
plot_snmf.ggplot.770.r

# kk
