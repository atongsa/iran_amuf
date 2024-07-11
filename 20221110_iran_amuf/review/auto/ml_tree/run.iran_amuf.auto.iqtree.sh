#!/usr/bin/env bash
#SBATCH -J at.tree #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode_all # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 4
#SBATCH --mem=40G
#SBATCH -t 4-00:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/auto_tree

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_vcf/a_t/'
i_d='sel.id'

fa_n='sel.pr.vf.min4.fasta'
op_p='tree.auto.41'

# run
## vf2fa
bcftools view -S sel.id $v_f/sheep.810.$f.bisnp.pass.vcf.gz > sel.vf

bcftools view -i 'F_MISSING < 0.01 & MAF > 0.05' sel.vf -Oz -o sel.fl.vf.gz

bcftools +prune -m 0.1 -w 1000kb sel.fl.vf.gz -o sel.pr.vf

vcf2phylip.py -i sel.fl.vf.gz -f

## fa2tree
iqtree2 -st DNA \
    -m GTR+G+I -B 1000 -T 2 -s $fa_n --prefix $op_p

# kk