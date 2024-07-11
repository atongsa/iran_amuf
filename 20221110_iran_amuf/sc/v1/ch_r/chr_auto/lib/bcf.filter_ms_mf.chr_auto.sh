#!/usr/bin/env bash
#SBATCH -J bft.at42_id
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# args
ch_r='at42_id'

mi_ss='0.1'
ma_f='0.01'
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_vcf/a_t'
op_n=$ch_r.ms01_mf001.vcf.gz

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001

# miss_maf
bcftools view -i 'F_MISSING < 0.1 & MAF > 0.01' $v_f/sheep.810.${ch_r}.bisnp.pass.vcf.gz -Oz -o $op_n
bcftools index -t $op_n

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
