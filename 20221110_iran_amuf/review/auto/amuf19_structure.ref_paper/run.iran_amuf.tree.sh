#!/usr/bin/env bash
#SBATCH -J mt.tree #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 2
#SBATCH --mem=40G
#SBATCH -t 4-00:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/iroo_structure/tree

# bed2vf
plink \
    --bfile iroo.fl.14 \
    --autosome-num 26 \
    --recode vcf-iid bgz \
    --out iroo.14

bcftools reheader -s kv.id iroo.14.vcf.gz > iroo.14.nir.vcf.gz

# vf2tree
v_f='../fl/iroo.14.nir.vcf.gz'

VCF2Dis	-i $v_f -o p_dis.mat
fastme -n -i p_dis.mat -o dis.nwk

# plot_tree




# kk