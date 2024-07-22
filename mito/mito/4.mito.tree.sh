#!/usr/bin/env bash
#SBATCH -J aln.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode_all # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 36
#SBATCH -t 4-00:00
#SBATCH -o j.at42_id.o
#SBATCH -e j.at42_id.e

cd /public/home/d0202110815/at42/proj/iran_amuf/v2/mito/tree

# args
f_a='/public/home/d0202110815/at42/proj/iran_amuf/v2/mito/aln/mito.1104.trim.fa'

# run
iqtree2 -s $f_a -m MF --prefix mf/tree.mf -o 'bighorn1' -T AUTO

iqtree2 -s $f_a -m GTR+I+G -B 1000 --prefix gtr/tree.gtr -o 'bighorn1' -T AUTO

# iqtree2 -s $f_a --prefix auto/tree.auto -o 'bighorn1'
# iqtree2 -s $f_a -B 1000 --prefix auto/tree.auto -o 'bighorn1'

# kk