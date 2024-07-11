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

ref_pp='O.orientalis_1'
ref_pp_id='O.orientalis_1:266,271,272,KR.4,KR.6,SH.7,YZ.11,YZ.12,YZ.9'

# run
smc++ vcf2smc -m $mask_bed $v_f data/$p_p.12.smc.gz 1 $pp_id $ref_pp_id
smc++ vcf2smc -m $mask_bed $v_f data/$p_p.21.smc.gz 1 $ref_pp_id $pp_id

smc++ split --base $p_p -o split/ pop/$p_p.mu2.final.json pop/$ref_pp.mu2.final.json data/{$p_p,$ref_pp}.*smc.gz

#--spline cubic $m_u1

# kk
id_ls='vf2smc.2.pop'
m_sh='m2.sh'

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
