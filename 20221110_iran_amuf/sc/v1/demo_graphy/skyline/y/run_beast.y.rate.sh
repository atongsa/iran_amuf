#!/usr/bin/env bash
#SBATCH -J sky.rate
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# pt
export PATH='/public/home/d0202110815/at42/app/beast/beast/bin':$PATH

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_y/run

# args
p_f='rate.y.'
c_f='rate.xml'

# run
beast -overwrite -seed 42 -prefix $p_f -threads 8 $c_f

# kk
