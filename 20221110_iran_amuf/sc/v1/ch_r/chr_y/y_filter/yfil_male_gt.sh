#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_y/v1/filter

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_vcf/sex_chr/sheep.810.28.bisnp.pass.vcf.gz'

ewe_id='db/ewe.id'
ram_vf='no_heterozygous/ram.vcf.gz'

# select_780
cd /public/home/d0202110815/at42/proj/iran_amuf/chr_y
pk_p='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_pk'
ch_r=28

plink --bfile $pk_p/pk.$ch_r \
    --allow-extra-chr \
    --chr-set 26 \
    --chr $ch_r \
    --keep pk.id \
    --make-bed \
    --out pk_780.$ch_r

# select_ewe
#bcftools view -S $ram_id --min-ac=1 $v_f > ram.vcf
bcftools view -S $ewe_id $v_f -Ob -o male_gt/ewe.bcf

# ewe_gt
bcftools view -i 'F_MISSING<0.99' male_gt/ewe.bcf |\
bcftools query -f '%CHROM\t%POS\n' > male_gt/ewe.pos

bcftools view -i 'F_MISSING<0.95' male_gt/ewe.bcf |\
bcftools query -f '%CHROM\t%POS\n' > male_gt/ewe.miss0.95.pos

bcftools view -i 'AN > 4' male_gt/ewe.bcf |\
bcftools query -f '%CHROM\t%POS\n' > male_gt/ewe.4an.pos

# male_snp
bcftools view -T ^male_gt/ewe.pos $ram_vf -Oz -o male_gt/ram.vcf.gz
tabix -p vcf male_gt/ram.vcf.gz

bcftools view -T ^male_gt/ewe.miss0.95.pos $ram_vf -Oz -o male_gt/ram.miss0.95.vcf.gz
tabix -p vcf male_gt/ram.miss0.95.vcf.gz

bcftools view -T ^male_gt/ewe.4an.pos $ram_vf -Oz -o male_gt/ram.4an.vcf.gz
tabix -p vcf male_gt/ram.4an.vcf.gz

# count
bcftools view -H male_gt/ram.vcf.gz | wc -l # 260; 0.01
bcftools view -H male_gt/ram.miss0.95.vcf.gz | wc -l # 4096; 0.05
bcftools view -H male_gt/ram.4an.vcf.gz | wc -l # 11; just 2 sample

# kk
