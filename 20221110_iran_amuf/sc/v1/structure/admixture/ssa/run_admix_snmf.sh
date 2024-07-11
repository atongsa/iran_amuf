#!/usr/bin/env bash
#SBATCH -J o.at42_id
#SBATCH -p Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/admix_ture/snmf

# args
#K=at42_id

# geno
#vcf2geno ssa.vcf

# prune
for K in `seq 2 10`
do
echo K=$K
sNMF -x ../v_f/ssa.geno -K $K -c -s 42 -p 2 > snmf.$K.log
done

# kk
id_ls='pop.id'
m_sh='m.sh'

cat $id_ls | while read at_id
do
    sed "s/at42_id/$at_id/g" $m_sh > sc/$at_id.sh
    chmod 755 sc/$at_id.sh
done

cd sc
for s_h in *sh
do
		printf "%s:\t" $s_h
    sbatch --parsable $s_h
done > ../sbatch.log
