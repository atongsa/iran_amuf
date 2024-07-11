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
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/admix_ture/v_f

# concat
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/pr_2_vf
bcftools concat -f vf.ls -Oz -o m_g/pr.vcf.gz
tabix -p vcf pr.vcf.gz

bcftools sort -Oz pr.vcf.gz -o pr.st.vcf.gz
tabix -p vcf pr.st.vcf.gz

# run
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/admix_ture/v_f
bcftools view -S ssa.id pr.st.vcf.gz > ssa.vcf
#--force-samples

# kk
