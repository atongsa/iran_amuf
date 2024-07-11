#!/usr/bin/env bash
#SBATCH -J tree.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 10
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/structure/tree

# env
#export PATH=/public/home/d0202110815/at42/app/mamba/ins/envs/py/bin:$PATH

# args
#v_f='iran_sheep.vcf'

# v2p
#vcf2phylip.py -i $v_f --output-folder tree -o BJ1-2

# tree
# for f in cut*fa
# do
# nf=`echo $f | sed 's/cut.msa.nn.loc.//; s/.loc.csv.fa//'`
# echo $nf
# iqtree2 -s $f -m GTR+G -B 1000 --prefix tree.$nf
# done

iqtree2 -s iran_sheep.min4.phy -m GTR+G -B 1000 --prefix tree.iran_sheep --seqtype DNA --fast -T 8

# kk
#muscle -maketree -in del.msa.fa -out del.msa.nwk -cluster neighborjoining
#iqtree2 -s del.msa.n.fa -m GTR+G -B 1000
