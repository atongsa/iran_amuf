#!/usr/bin/env bash
#SBATCH -J o.at42_id.prune
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 4
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/vc_f/iran_sheep

# args
ch_r=at42_id

# prune
plink --bfile fil_ter/$ch_r \
--chr-set 26 \
--allow-extra-chr \
--set-missing-var-ids @_# \
--indep-pairwise 50 5 0.2 \
--out pru_ne/pr.$ch_r.site

plink --bfile fil_ter/$ch_r \
--chr-set 26 \
--allow-extra-chr \
--set-missing-var-ids @_# \
--extract pru_ne/pr.$ch_r.site.prune.in \
--make-bed \
--out pru_ne/pr.o.$ch_r

# kk
