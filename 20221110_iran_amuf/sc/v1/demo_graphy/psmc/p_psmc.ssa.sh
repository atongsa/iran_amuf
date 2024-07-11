#!/usr/bin/env bash
#SBATCH -J at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 2
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/psmc

# bam2fq
run_psmc.bam2fq.ssa.sh

# fq2psmc
run_psmc.fq2psmc.ssa.sh

# plot
plot_psmc.ssa.sh

# kk
