#!/usr/bin/env bash
#SBATCH -J 770.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/structure/snmf/run

# run
for K in `seq 2 14`
do
echo K=$K
sNMF -x ../v_f/770.geno -K $K -c -s 42 -p 2 > snmf.$K.log
done

# kk
