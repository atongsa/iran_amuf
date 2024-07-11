#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/bsp/y

# args
v_f='/public/home/d0202110815/at42/proj/iran_amuf/chr_auto/lv_vcf/sex_chr/sheep.810.28.bisnp.pass.vcf.gz'

s_p='/public/home/d0202110815/at42/proj/iran_amuf/review/bsp/y/s_p/sel.id'

pos_vf='/public/home/d0202110815/at42/proj/iran_amuf/chr_y/net_4k/ram.vcf.gz'

# run
#pos
bcftools view -G $pos_vf | bcftools view -H | cut -f1,2 > 4k.pos

#sel
bcftools view -S $s_p -R ../s_p/4k.pos $v_f > o.spe.vf

# beagle

# rm_het
bcftools view -e 'GT="het"' o.spe.vf > o.spe.nohet.vf

#vf2fa
vcf2phylip.py -i o.spe.nohet.vf -f 

#fat-
seqkit replace -p "N" -r "-" -s o.spe.nohet.vf.min4.fasta > o.spe.nohet.nogap.fa

# trim
f_a='o.spe.nohet.nogap.fa'
fa_op='o.msa.trim.fa'
trimal -automated1 -resoverlap 0.75 -seqoverlap 75 -in $f_a -out $fa_op

# Kk