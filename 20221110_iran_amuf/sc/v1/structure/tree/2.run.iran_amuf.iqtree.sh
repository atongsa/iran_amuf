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
cd /public/home/d0202110815/at42/proj/iran_amuf/structure/tree

# args
m_sa='sel.pr.vf.min4.fasta'

# iqtree
iqtree2 -m GTR+G+I -B 1000 -T 2 -s $m_sa --prefix 'auto.41'

# # date
# iqtree2 -m GTR+G+I -s $m_sa -te mt.768.treefile --prefix 'mt.768.date' --date-root 3.27 --date-tip 0 --date-ci 100

# kk
