#!/usr/bin/env bash
#SBATCH -J ph.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Cnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 6
#SBATCH -t 14-14:00
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/pha_se

# args
vf_ref='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/miss_maf/ms01_mf001/1.ms01_mf001.vcf.gz'

# phase_ref
shapit5_phase_common \
 --region 1 \
 --input $vf_ref \
 --output ph.sheep.810.1.bi.vcf.gz

tabix -p vcf ph.sheep.810.1.bi.vcf.gz

# kk

bcftools view -i 'MAF > 0.001' $vf_in

# --filter-maf 0.001 \


# kk
CHROM,POS,REF,ALT,-,TAG

INFO/END

echo -e '##INFO=<ID=AC,Number=A,Type=Integer,Description="Allele count in genotypes, for each ALT allele, in the same order as listed">
' >> hdr.txt

v_f='YZ.12.rmdup.bam.vcf.gz'
bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\t-\t%INFO/AC1\n' $v_f > $v_f.anno.tsv

bgzip $v_f.anno.tsv
tabix -s1 -b2 -e2 $v_f.anno.tsv.gz

bcftools annotate -a $v_f.anno.tsv.gz -h hdr.txt -c CHROM,POS,REF,ALT,-,INFO/AC $v_f -Oz -o ac.$v_f
tabix -p vcf ac.$v_f

#
