#!/usr/bin/env bash
#SBATCH -J o.co
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 6
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_sheep/ana/mito/msa/clustal_o

# run
clustalo -i o.all.fa -o o.co.msa.fa --auto --dealign --force

# kk
