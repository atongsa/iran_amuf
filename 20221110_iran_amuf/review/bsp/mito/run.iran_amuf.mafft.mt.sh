#!/usr/bin/env bash
#SBATCH -J pi.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode_all # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -t 4-00:00
#SBATCH -o j.at42_id.o
#SBATCH -e j.at42_id.e


# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/bsp/mt/msa

mafft --auto o.fa > o.msa.fa

# long_2_short
#seqkit replace -p "\s.+$" o.all.msa.fa > o.mafft.msa.s.fa

# kk
