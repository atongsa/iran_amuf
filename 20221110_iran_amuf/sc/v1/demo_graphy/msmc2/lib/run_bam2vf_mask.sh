#!/usr/bin/env bash
#SBATCH -J vm2.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Debug # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o %j.o
#SBATCH -e %j.e

# path
export PATH='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/app/seqbility-20091110:/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/app/mtools/msmc-tools-master:/public/home/d0202110815/at42/app/mamba/ins/envs/py/bin':$PATH

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/vf_mask2

# args
b_m='../b_m/new/at42_id.bam'
mas_k='at42_id.rmdup.bam.mask.bed.gz'
v_f='at42_id.rmdup.bam.vcf.gz'
ref_fa='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/f_a/sheep.ref.fa'
le_gd='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se/sp_100/chr.legend.gz'

# depth
D_P=$(samtools depth -r 1 $b_m | awk '{sum += $3} END{print sum / NR}')

# run
bcftools mpileup -B -q20 -Q20 -C50 -r 1 -f $ref_fa $b_m |\
	bcftools call -c -V indels |\
	bamCaller.py $D_P $mas_k --legend_file $le_gd |\
	bgzip -c > $v_f

tabix -p vcf $v_f

# kk
id_ls='id.ls'
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
    sbatch --parsable $s_h
done > ../sbatch.log
