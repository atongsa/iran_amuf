#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_mito/rate

# id
amuf
sheep

awk '$9=="HA"' mt.strata | cut -f1 | shuf -n 20 > ha.id
awk '$9=="HB"' mt.strata | cut -f1 | shuf -n 20 > hb.id
awk '$9=="HC"' mt.strata | cut -f1 | shuf -n 20 > hc.id

# fa
for f in *.id
do
seqkit grep -f $f -n o.926.trim.fa > $f.fa
done

cat h{a,b,d}.id.fa > habd.fa
cat h{c,e}.id.fa > hce.fa
mv oo.id.fa oo.fa

cat habd.fa hce.fa oo.fa > rate.fa

# rate
snp-sites -c -v rate.fa -o rate.vcf
vcf2phylip.py rate.vcf

cat oa.id | while read oa
do
cat oo.id | while read oo
do
echo -e $oa"\n"$oo > sel.id
bcftools view --min-ac=1 -S sel.id rate.vcf | grep -v '#' | wc -l
done
done > D.txt

datamash mean 1 <D.txt # 110

# cal
D=110/16606
g=3
T=653000
u=(Dg)/(2T)

D=0.0686
T=3270000
u=D/T

# for f in *.nn
# do
# trimal -automated1 -resoverlap 0.75 -seqoverlap 75 -in $f -out $f.2
# done

# config; 3.27M
site_model:
    gamma: 4
    Invariant: estimate
    substitution: GTR

clock: estimate

prior:
    coal bay sky
    ovis.prior: log_normal/3.27/0.00/mean in real space
    amuf_sheep.prior: log_normal/0.653/0.00/mean in real space

initial:
    bpopsize/bgroupsize: 5

chain: 40000000

# substitution
#sed '7,165d' rate.config.xml > model.xml
grep -v '<sequence' rate.config.xml > model.xml

fa_2_xml.sh sel.trim.fa

f='sel.trim.fa.fa_xml'
insert_block.py model.xml $f 6 ${f%.fa_xml}.xml

# run
export PATH='/public/home/d0202110815/at42/app/beast/beast/bin':$PATH
beast -seed 42 -threads 2 sel.trim.fa.xml

# kk
