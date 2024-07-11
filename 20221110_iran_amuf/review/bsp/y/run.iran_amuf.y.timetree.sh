#!/usr/bin/env bash
#SBATCH -J sky.y
#SBATCH -p Cnode_all # Fnode2/Fnode1/Gnode/Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# pt
export PATH='/public/home/d0202110815/at42/app/beast/beast/bin':$PATH

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/time_tree

# run; -prefix mito.o2
c_f='/public/home/d0202110815/at42/proj/iran_amuf/review/time_tree/y.time.xml'

for f in {a..c}
do
beast -overwrite -seed 42 -prefix ttree.y.$f. -threads 8 $c_f
done

# kk
sbatch --parsable $s_h

