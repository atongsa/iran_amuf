#!/usr/bin/env bash
#SBATCH -J dtrio_at42_id
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/v_f

# args
s_p='../sam_ple/sel.id'

# 
for f in {1..26}
do
bcftools view -S $s_p a_t/sheep.810.$f.bisnp.pass.vcf.gz -Ou |\
bcftools view -i 'F_MISSING < 0.01 & MAF > 0.05' -Oz > d.$f.vf.gz
done

# kk