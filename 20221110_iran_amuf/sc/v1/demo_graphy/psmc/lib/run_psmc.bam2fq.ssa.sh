#!/usr/bin/env bash
#SBATCH -J at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/psmc

# args
ref_fa='/public/home/d0202110815/at42/proj/iran_amuf/genome/chr_auto/sheep_chr_num.fna'
bam_p='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/psmc/bam'

# index
#samtools faidx sheep_chr_num.fna

# args
i_d='at42_id'

# bam2fq_1
bcftools mpileup -r 1 -Q 30 -q 30 -C50 -f $ref_fa $bam_p/${i_d}.rd.bam |\
 bcftools call -c |\
 vcfutils.pl vcf2fq -d 4 -D 60 -Q 30 | bgzip > fq/$i_d.diploid.fq.gz

# fq2psmc
fq2psmcfa -q20 fq/$i_d.diploid.fq.gz > fa/$i_d.diploid.psmcfa
psmc -N25 -t15 -r5 -p "4+25*2+4+6" -o psmc/$i_d.diploid.psmc fa/$i_d.diploid.psmcfa

splitfa fa/$i_d.diploid.psmcfa > fa/$i_d.split.psmcfa

seq 100 | xargs -i echo psmc -N25 -t15 -r5 -b -p "4+25*2+4+6" \
    -o psmc/$i_d.round-{}.psmc fa/$i_d.split.psmcfa | sh

cat psmc/$i_d.diploid.psmc psmc/$i_d.round-*.psmc > psmc/$i_d.combined.psmc

# kk
id_ls='o2.id.ls'
m_sh='r.sh'

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
