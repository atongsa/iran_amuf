#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/v2/v_f/m_g

# rsync
chmod 777 /public/home/d0202110815/
chmod -R 777 /public/home/2020024/GSE/wgs_bam/vcf/f_l
rsync -aPv --no-o --no-g /public/home/2020024/GSE/wgs_bam/vcf/f_l /public/home/d0202110815/tmp/
rm -rf /public/home/d0202110815/tmp/f_l
chmod 700 /public/home/d0202110815/

# args
vf_old='/public/home/d0202110815/at42/proj/iran_amuf/v2/v_f/lv_779_pr/iran_sheep.pr.vcf.gz' # 779
vf_new='/public/home/d0202110815/tmp/nw.st.vcf.gz' # 8 sheep
vf_lv_810='/public/home/d0202110815/at42/proj/back/lv_vcf/a_t'

# concat_new
ls *gz > ../vf.ls
bcftools concat -f ../vf.ls -Oz -o ../nw.vcf.gz
bcftools sort -Oz nw.vcf.gz -o nw.st.vcf.gz
tabix -p vcf nw.st.vcf.gz
rm nw.vcf.gz*

# mg
bcftools merge -l merge.txt -Oz -o merge.vcf.gz
tabix -p vcf merge.vcf.gz

# kk