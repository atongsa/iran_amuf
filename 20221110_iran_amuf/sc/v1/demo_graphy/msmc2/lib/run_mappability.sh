#!/usr/bin/env bash
#SBATCH -J vm.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -o %j.o
#SBATCH -e %j.e

# ref
echo """
http://lh3lh3.users.sourceforge.net/snpable.shtml
https://github.com/mishaploid/Bo-demography/blob/86e618b2156c55942bad0b79fb75df8e578cc3a0/rules/trash/mask.smk
https://github.com/jessicarick/msmc2_scripts
"""

# path
export PATH='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/app/seqbility-20091110:/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/app/mtools/msmc-tools-master':$PATH

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/mappa_bility

# ref_fa
cd ref_fa

ref_fa='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/f_a/sheep.ref.fa'

# simu_fa
cd simu_fa
seqkit grep -p 1 $ref_fa > chr1.fa

f_a='chr1.fa'
splitfa $f_a 100 > simu_chr1.fa

# fa_2_sam
cd simu_sam

f_a="../simu_fa/simu_chr1.fa"
op_p='chr1'

#bwa index $ref_fa

bwa aln -R 1000000 -O 3 -E 3 $ref_fa $f_a > simu_reads.$op_p.sai
bwa samse -f simu_reads.$op_p.sam $ref_fa simu_reads.$op_p.sai $f_a

## select_sam
# samtools view -H simu_merge.sam > sm.h
#
# echo 1_{1..301310028} | tr ' ' '\n' > id.ls
# grep '^1_' simu_merge.sam > chr1_read.sam

## sam_2_mask_fa
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/mappa_bility/simu_mask_fa
gen_raw_mask.pl ../simu_sam/simu_reads.chr1.sam > rawMask_100.chr1.fa
gen_mask -l 100 -r 0.5 rawMask_100.chr1.fa > mask_100_50.chr1.fa

## fa2bed
#seqkit split -i -O split mask_100_50.fa
makeMappabilityMask.py mask_100_50.chr1.fa

# kk
echo {b..k} | tr ' ' '\n' > id.ls
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
    printf "%s:\t" $s_h
    sbatch --parsable $s_h
done > ../sbatch.log
