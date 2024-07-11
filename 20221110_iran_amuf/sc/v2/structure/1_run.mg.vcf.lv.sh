#!/usr/bin/env bash

# cd
/public/home/d0202110815/gse/wgs 

# merge
for i in {1..26};
do 
   echo '#!/bin/bash' >> IG.1_Chr${i}.job
   echo '#SBATCH -J 'IG_Chr${i}'' >> IG.1_Chr${i}.job
   echo "#SBATCH -p Cnode_all"  >> IG.1_Chr${i}.job
   echo "#SBATCH -t 24:00:00" >> IG.1_Chr${i}.job
   echo "#SBATCH -N 1" >> IG.1_Chr${i}.job
   echo "#SBATCH -n 4" >> IG.1_Chr${i}.job
   echo '#SBATCH -o /public/home/d0202110815/gse/wgs/IG.1_Chr'${i}.o'' >> IG.1_Chr${i}.job
   echo '#SBATCH -e /public/home/d0202110815/gse/wgs/IG.1_Chr'${i}.e'' >> IG.1_Chr${i}.job
   echo "date" >> IG.1_Chr${i}.job 
   echo 'bcftools merge --threads 4 -Oz -o /public/home/d0202110815/gse/wgs/chr'${i}'.merged.vcf.gz /public/home/d0202110815/tmp/f_l/chr'${i}'.snp.vcf.gz /public/home/d0202110815/at42/proj/back/lv_vcf/a_t/sheep.810.'${i}'.bisnp.pass.vcf.gz'  >> IG.1_Chr${i}.job
   echo "bcftools index -t --threads 4 /public/home/d0202110815/gse/wgs/chr${i}.merged.vcf.gz" >> IG.1_Chr${i}.job
   echo "date" >> IG.1_Chr${i}.job
done

# extract bighorn/urial/sheep/mouflon


# kk