#!/usr/bin/env bash
#SBATCH -J div.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Gnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=40G
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/msmc_div

# path
export PATH='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/app/seqbility-20091110:/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/app/mtools/msmc-tools-master':$PATH

# args
pp_n='at42_id' # AME/ME/O.orientalis_2/SSA

# run
p_p1=`echo {0..3}, | tr -d ' ' | sed 's/,$//'`
p_p2=`echo {4..7}, | tr -d ' ' | sed 's/,$//'`
p_p=`echo {0..3}-{4..7}, | tr -d ' ' | sed 's/,$//'`

msmc2 -s -I $p_p1 -o $pp_n.p1 ../msmc_ip/$pp_n.amuf_1.chr1.multihetsep.txt

msmc2 -s -I $p_p2 -o $pp_n.p2 ../msmc_ip/$pp_n.amuf_1.chr1.multihetsep.txt

msmc2 -s -I $p_p -o $pp_n.p12 ../msmc_ip/$pp_n.amuf_1.chr1.multihetsep.txt

combineCrossCoal.py $pp_n.p12.final.txt $pp_n.p1.final.txt $pp_n.p2.final.txt > combine.$pp_n.final.txt

# kk
id_ls='id.ls3'
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
