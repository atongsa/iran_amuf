#!/usr/bin/env bash
#SBATCH -J ph.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Gnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se

# args
vf_ref='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se/sp_100/ph.ssa.chr1.vcf.gz'

vf_p='/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/vf_mask'

sp_id='at42_id'

# bisnp
bcftools view -M2 -v snps -r 1 -Oz $vf_p/${sp_id}.rmdup.bam.vcf.gz > $sp_id.bi.vcf.gz
tabix -p vcf $sp_id.bi.vcf.gz

# phase_at_vf
shapit5_phase_common \
 --reference $vf_ref \
 --region 1 \
 --thread 2 \
 --input ${sp_id}.bi.vcf.gz \
 --output ph.$sp_id.vcf.gz

tabix -p vcf ph.$sp_id.vcf.gz

# replace
bcftools merge --force-samples $sp_id.bi.vcf.gz ph.$sp_id.vcf.gz | awk '
  BEGIN {OFS="\t"}
  $0 ~ /^##/ {print}
  $0 ~ /^#CHROM/ {print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}
  $0 !~ /^#/ {
    if(substr($11, 1, 3) != "./.")
      $10 = $11
    print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
}' | bcftools view -O z > og_ph.$sp_id.vcf.gz

tabix -p vcf og_ph.$sp_id.vcf.gz

# kk
id_ls='id.ls'
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
