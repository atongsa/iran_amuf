#!/usr/bin/env bash
#SBATCH -J ip.at42_id_3 #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Gnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/msmc_ip

# path
export PATH='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/app/seqbility-20091110:/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/app/mtools/msmc-tools-master':$PATH

# args
id_1='at42_id_1'
id_2='at42_id_2'
id_3='at42_id_3'

mask_all='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/mappa_bility/simu_mask_bed/chr_1.mask.bed.gz'

mask_ind1="/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/vf_mask/$id_1.rmdup.bam.mask.bed.gz"
vf1="/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se/og_ph.$id_1.vcf.gz"

mask_ind2="/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/vf_mask/$id_2.rmdup.bam.mask.bed.gz"
vf2="/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se/og_ph.$id_2.vcf.gz"

mask_ind3="/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/vf_mask/YZ.11.rmdup.bam.mask.bed.gz"
vf3="/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se/og_ph.YZ.11.vcf.gz"

mask_ind4="/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/vf_mask/272.rmdup.bam.mask.bed.gz"
vf4="/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se/og_ph.272.vcf.gz"

op_n="$id_3.amuf_1.chr1.multihetsep.txt"

# run
generate_multihetsep.py --chr 1 \
    --mask $mask_all \
    --mask $mask_ind1 --mask $mask_ind2 \
    --mask $mask_ind3 --mask $mask_ind4 \
    $vf1 $vf2 $vf3 $vf4 > $op_n

# kk
id_ls='nid.3.ls'
m_sh='m.sh'

cat $id_ls | while read p1 p2 p3
do
    sed "s/at42_id_1/$p1/g; s/at42_id_2/$p2/g; s/at42_id_3/$p3/g;" $m_sh > sc/$p3.sh
    chmod 755 sc/$p3.sh
done

cd sc
for s_h in *sh
do
	printf "%s\t" $s_h
    sbatch --parsable $s_h
done > ../sbatch.log

# pre
sed '/^\t*$/d' nid.ls > nid.2.ls
awk '{ORS=(NR%2?"\t":RS)}1' nid.2.ls |\
    cut -f1,3,4 > nid.3.ls
