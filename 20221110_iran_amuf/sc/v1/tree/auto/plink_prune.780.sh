#!/usr/bin/env bash
#SBATCH -J at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -n 1
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_auto/pk_780/prune

# arg
ch_r=at42_id
b_f="../pk_780/pk_780.$ch_r"

# prune
#bcftools +prune -m 0.25 -w 1000 input.bcf -Ob -o output.bcf

# prune
plink --bfile $b_f \
--chr-set 26 \
--allow-extra-chr \
--set-missing-var-ids @_# \
--indep-pairwise 50 10 0.1 \
--out $ch_r.site

plink --bfile $b_f \
--chr-set 26 \
--allow-extra-chr \
--set-missing-var-ids @_# \
--extract $ch_r.site.prune.in \
--make-bed \
--out pr.$ch_r

# kk
seq 28 > chr.id
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
#sbatch --parsable $s_h
./$s_h
done > ../sbatch.log

# kk
