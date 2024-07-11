#!/usr/bin/env bash
#SBATCH -J es.at42_id_1
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/estimate

# args
#m_u1='1.51e-8'
m_u2='1e-8'
g_t='3'

v_f='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/v_f/smc.vcf.gz'
mask_bed='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/mask/sheep.trf.s.bed.gz'

p_p='at42_id_1'
pp_id='at42_id_2'

# run
smc++ vcf2smc -m $mask_bed $v_f data/$p_p.smc.gz 1 $pp_id
# smc++ estimate --base $p_p.mu1 -o pop --spline cubic $m_u1 data/$p_p.smc.gz
smc++ estimate --base $p_p.mu2 -o pop --spline cubic $m_u2 data/$p_p.smc.gz

# kk
id_ls='../sam_ple/vf2smc.pop2'
m_sh='m.sh'

cat $id_ls | while read at_id_1 at_id_2
do
    sed "s/at42_id_1/$at_id_1/g; s/at42_id_2/$at_id_2/g;" $m_sh > sc/$at_id_1.sh
    chmod 755 sc/$at_id_1.sh
done

cd sc
for s_h in *sh
do
    printf "%s\t" $s_h
    sbatch --parsable $s_h
done > ../sbatch.log
