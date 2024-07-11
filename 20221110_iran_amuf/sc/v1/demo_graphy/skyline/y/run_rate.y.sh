#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_y/fa

# id
amuf
sheep
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_y/sam_ple
awk '$5=="HY1"' oa.strata | cut -f1 | shuf -n 60 > y1.id
awk '$5=="HY2"' oa.strata | cut -f1 | shuf -n 60 > y2.id

# fa
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_y/fa

f_a='ram.p.min239.fasta'
for f in *.id
do
seqkit grep -f $f -n $f_a > $f.nn
done

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
