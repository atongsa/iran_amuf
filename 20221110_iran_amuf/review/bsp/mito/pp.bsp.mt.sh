#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/bsp/mt

# msa
run.iran_amuf.mafft.mt.sh

# trim
run.iran_amuf.trimal.mt.sh

# fa2ctl
# config; 3.27M
site_model:
    gamma: 4
    Invariant: estimate
    substitution: GTR

clock: estimate

prior:
    coal bay sky
    ovis.prior: log_normal/4.3/0.1/mean in real space
space

initial:
    bpopsize/bgroupsize: 5

chain: 3 * 10000000/1000


#amuf_sheep.prior: log_normal/0.653/0.00/mean in real 

# mutation_rate
run.iran_amuf.beast.mr.mt.sh

merge trees with treeannotator

get mt_rate: 

#combine_tree
logcombiner -o o.mr.log \
-log v1/ovis.mut_rate.mt.log \
-log v2/ovis.mut_rate.mt.log \
-log v3/ovis.mut_rate.mt.log 

logcombiner -o o.mr.tree \
-log v1/ovis.mut_rate.mt-o.trees \
-log v2/ovis.mut_rate.mt-o.trees \
-log v3/ovis.mut_rate.mt-o.trees 

# tracer
mit: 9.441 e-9 s/y 3 year/generation

# estimate_bsp
c_f='bsp.ohce.xml'
grep -v 'sequence id="seq' $c_f > bsp.blank.cfg
c_f='bsp.blank.cfg'

fa_2_xml.sh hce.fa
fa_2_xml.sh habd.fa

for f in {hce,habd}.fa
do
b_k=$f.fa_xml
insert_block.py $c_f $b_k 6 bsp.$f.xml
done

run.iran_amuf.mt.skyline.sh

# plot_bsp
for f in {ohce,hce,habd}
do
p_t='../mt/bsp/'
logcombiner -o mg.$f.log \
-log $p_t/bsp.$f.absp.$f.log \
-log $p_t/bsp.$f.bbsp.$f.log \
-log $p_t/bsp.$f.cbsp.$f.log

logcombiner -o mg.$f.tree \
-log $p_t/bsp.$f.absp.$f-o.trees \
-log $p_t/bsp.$f.bbsp.$f-o.trees \
-log $p_t/bsp.$f.cbsp.$f-o.trees
done

plot.iran_amuf.skyline.mt.r

# beast
for f in {o.ce,ce,abd}
do
seqkit grep -f $f.id ../o_g/o.926.trim.fa |\
seqkit replace -p '(^.*$)' -r "$f.\$1" > $f.fa
done

# kk