#!/usr/bin/env bash
#SBATCH -J aln.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode_all # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -t 4-00:00
#SBATCH -o j.at42_id.o
#SBATCH -e j.at42_id.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/v2/mito/aln

# args
f_a='/public/home/d0202110815/at42/proj/iran_amuf/v2/mito/fa/all.1104.mito'
op_n='mito.1104.aln.fa'

# run
mafft --auto $f_a > $op_n

# kk