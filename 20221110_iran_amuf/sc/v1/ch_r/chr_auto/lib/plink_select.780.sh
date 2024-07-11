#!/usr/bin/env bash
#SBATCH -J at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 1-00:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_780

# args
pk_p='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_pk'
ch_r=28 #at42_id

# sp
plink --bfile $pk_p/pk.$ch_r \
    --allow-extra-chr \
    --chr-set 26 \
    --chr $ch_r \
    --keep pk.id \
    --make-bed \
    --out pk_780.$ch_r 

# grep
grep 'variants and 780 samples' pk.log | cut -f1 -d' ' | datamash sum 1 # 121,252,917

# kk
seq 28 > chr.id
id_ls='chr.id'
m_sh='m.sh'

cat $id_ls | while read at_id
do
    sed "s/at42_id/$at_id/g" $m_sh > sc/$at_id.sh
    chmod 755 sc/$at_id.sh
done

cd sc
for s_h in *sh
do
	printf "%s\t" $s_h
    ./$s_h
    #sbatch --parsable $s_h
done > ../pk.log
