#!/usr/bin/env bash
#SBATCH -J nj.y.tree #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=40G
#SBATCH -t 4-00:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/phylo/y/nj

# args
m_sa='../fa/ram.p.min239.fasta'

# nj
treebest nj -W -b 1000 -t kimura $m_sa > y.nj.239.nhx

# kk
