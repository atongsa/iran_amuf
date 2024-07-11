#!/usr/bin/env bash
#SBATCH -J prune
#SBATCH -p xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public1/home/casdao/kdylvfenghua/kdyatongsa1/proj/p_thesis/amuf_roh/amuf_structure/vcf_prune

# prune
for f in `seq 26`
do
plink --bfile ../v_f/amuf.$f \
--chr-set 26 \
--allow-extra-chr \
--set-missing-var-ids @_# \
--indep-pairwise 50 10 0.1 \
--out pr.amuf.$f.site
done

for f in `seq 26`
do
plink --bfile ../v_f/amuf.$f \
--chr-set 26 \
--allow-extra-chr \
--set-missing-var-ids @_# \
--extract pr.amuf.$f.site.prune.in \
--make-bed \
--out pr.amuf.$f
done

# kk
