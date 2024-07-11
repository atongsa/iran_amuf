#!/usr/bin/env bash
#SBATCH -J s.snp
#SBATCH -p Cnode_all
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -t 4-00:00
#SBATCH -o j.s.o
#SBATCH -e j.s.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/gene/ld_decay

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/v_f/d.10.vcf.gz'
s_p='id.ls'
r_g='10:41185017-41913112'

ai_pcdh9_vf='pcdh9.ld_blk.vcf'
op_p='ai_pcdh9.ssa4.ldblk'
gf_f='fake.gff'

# run
## ssa4.vcf
bcftools view $v_f -S $s_p -r $r_g -i 'F_MISSING < 0.01 & MAF > 0.05'> $ai_pcdh9_vf

# ld_decay
PopLDdecay -InVCF $v_f -MaxDist 300 -OutStat ld_dcy_chr10 -SubPop $s_p

PopLDdecay -InVCF $ai_pcdh9_vf -MaxDist 300 -OutStat ld_dcy_ai -SubPop $s_p

# clean
gunzip $gz

for f in *.stat;
do
g_p=${f%.stat}
g_p2=${g_p#ld_dcy_}
sed '1 d' $f | awk -vg_p=$g_p2 'BEGIN{OFS="\t"}{print g_p, $1, $2}'
done > decay.tsv

# kk