#!/usr/bin/env bash
#SBATCH -J sm_sp.at42_id
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/d_stats/pbs

# args
ch_r='at42_id'

vf_p='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001'

v_f=$vf_p/${ch_r}.ms01_mf001.vcf.gz

p1='sample_info/SSA_4.tsv'
p2='sample_info/MEN.tsv'
p3='sample_info/O.orientalis_2.tsv'
p_all='sample_info/s.v.id'

# select_vf
#bcftools view -S $p_all $v_f > v_f/$ch_r.vcf

# pbscan
seq 26 | while read ch_r
do
pbscan -win 50 -step 25 -div 1 -vcfp v_f/$ch_r.vcf -pop1 $p1 -pop2 $p2 -pop3 $p3 -out pbs_can/pbs_ssa4.$ch_r
done

# kk
seq 26 > chr.id
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
		printf "%s:\t" $s_h
    sbatch --parsable $s_h
done > ../sbatch.log
