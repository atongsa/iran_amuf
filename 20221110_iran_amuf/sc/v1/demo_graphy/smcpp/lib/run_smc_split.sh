#!/usr/bin/env bash
#SBATCH -J sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH -t 6-14:00
#SBATCH -o at42_id_1.at42_id_2.o #%j.o
#SBATCH -e at42_id_1.at42_id_2.e #%j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp

# args
v_f='v_f/smc.vcf.gz'

pop_1='at42_id_1'
pop_2='at42_id_2'

# pop_c
p1_c=`awk -vp_p="$pop_1" '$1==p_p{print $2}' smc_pop_txt/smc.txt`
p2_c=`awk -vp_p="$pop_2" '$1==p_p{print $2}' smc_pop_txt/smc.txt`

# run
smc++ vcf2smc -m trf_bed/chr7.trf.st.bed.gz $v_f s_plit/j_t/$pop_1.${pop_2}.12.smc.gz 7 $p1_c $p2_c
smc++ vcf2smc -m trf_bed/chr7.trf.st.bed.gz $v_f s_plit/j_t/$pop_1.${pop_2}.21.smc.gz 7 $p2_c $p1_c

smc++ split --base $pop_1.${pop_2} -o s_plit/f_t/ esti_mate/$pop_1.1.51e-8.final.json esti_mate/$pop_2.1.51e-8.final.json s_plit/j_t/{$pop_1.$pop_2.12,$pop_1.$pop_2.21,$pop_1,$pop_2}.smc.gz &> s_plit/f_t/$pop_1.${pop_2}.r.log

# kk
cat p1.txt | while read p_1;do
cat p2.txt | while read p_2; do
echo -e $p_1"\t"$p_2
done
done > split_arg.tsv

arg_f='../smc_pop_txt/split_arg.tsv'
m_sh='split.sh'
s_c_p='sc_split'

cat $arg_f | while read at_id_1 at_id_2
do
    sed "s/at42_id_1/$at_id_1/g; s/at42_id_2/$at_id_2/g" $m_sh > $s_c_p/$at_id_1.$at_id_2.sh
    chmod 755 $s_c_p/$at_id_1.$at_id_2.sh
done

##########################################################################
## plot_divergence_time
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/estimate/split

g=3
a_rg='/public/home/d0202110815/at42/proj/iran_amuf/ana/demo_graphy/chr_auto/smc_pop_txt/split_arg.tsv'

cat $a_rg | while read pop_1 pop_2
do
smc++ plot -g $g -c $pop_1.${pop_2}.${g}_15.svg ../f_t/$pop_1.${pop_2}.final.json
done

# kk
