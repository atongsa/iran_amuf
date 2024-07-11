#!/usr/bin/env bash
#SBATCH -J o.at42_id.prune
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/y_chr/sex

# args
v_f='sex.bi.filter.vcf'

# prune
plink --vcf $v_f \
--chr-set 26 \
--allow-extra-chr \
--set-missing-var-ids @_# \
--indep-pairwise 50 5 0.2 \
--out pru_ne/pr.$v_f.site

plink --vcf $v_f \
--chr-set 26 \
--allow-extra-chr \
--set-missing-var-ids @_# \
--extract pru_ne/pr.$v_f.site.prune.in \
--make-bed \
--out pru_ne/pr.sel.$v_f

# kk
