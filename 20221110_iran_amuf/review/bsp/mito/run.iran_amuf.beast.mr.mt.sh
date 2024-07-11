#!/usr/bin/env bash
#SBATCH -J pi.at42_id
#SBATCH -p Cnode_all
#SBATCH -N 1
#SBATCH -n 2
#SBATCH -t 4-00:00
#SBATCH -o j.at42_id.o
#SBATCH -e j.at42_id.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/bsp/mt/mutate_r/

cd v1

# args
c_f='/public/home/d0202110815/at42/proj/iran_amuf/review/bsp/mt/c_f/ovis.mut_rate.mt.xml'

export PATH='/public/home/d0202110815/at42/app/beast/beast/bin':$PATH
beast -seed 42 -threads 2 $c_f

# kk