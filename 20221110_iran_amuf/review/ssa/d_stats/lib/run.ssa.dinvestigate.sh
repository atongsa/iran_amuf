#!/usr/bin/env bash
#SBATCH -J dinves_at42_id
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 6-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# path
export LD_LIBRARY_PATH="/public/software/compiler/gcc/7.3.1/lib64:/public/software/compiler/gcc/7.3.1/lib:/public/software/compiler/gcc/7.3.1/external_libs/lib":$LD_LIBRARY_PATH

# args
ch_r='at42_id'

vf_p='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/v_f'

sp_p='/public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/sam_ple'

pop_s=$sp_p/sel.strata
trio_s=$sp_p/d.trio.inves.tsv

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/ssa/d_fd/d_inves

# run
Dsuite Dinvestigate -w 50,25 -n dinves.$ch_r \
$vf_p/d.${ch_r}.vf.gz $pop_s $trio_s

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
cd ..
