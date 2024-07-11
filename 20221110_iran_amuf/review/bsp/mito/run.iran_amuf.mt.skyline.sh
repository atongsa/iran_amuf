#!/usr/bin/env bash
#SBATCH -J sky.at42_id
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
cd /public/home/d0202110815/at42/proj/iran_amuf/review/bsp/mt/bsp

# run; -prefix mito.o2
p_f='at42_id'
c_f='/public/home/d0202110815/at42/proj/iran_amuf/review/bsp/mt/c_f'

for f in {a..c}
do
beast -overwrite -seed 42 -prefix bsp.$p_f.$f. -threads 8 $c_f/bsp.$p_f.xml
done

# kk
id_ls='id.ls'
m_sh='r.sh'

cat $id_ls | while read at_id
do
    sed "s/at42_id/$at_id/g" $m_sh > sc/$at_id.sh
    chmod 755 sc/$at_id.sh
done

cd sc
for s_h in *sh
do
printf "%s\t" $s_h
sbatch --parsable $s_h
done > ../sbatch.log
