#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/review/bsp/y

# select_fa
run.iran_amuf.beast.select_fa.sh

# # msa
# run.iran_amuf.mafft.y.sh

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
# c_f='/public/home/d0202110815/at42/proj/iran_amuf/review/bsp/mt/c_f/y.mr.cfg.xml'
# grep -v 'sequence id="seq' mr.cfg > mr.blank.cfg
# c_f='mr.blank.cfg'

# b_k='o.msa.trim.fa.fa_xml'

# fa_2_xml_blk.sh
# insert_block.py $c_f $b_k 6 mr.y.cfg

run.iran_amuf.beast.mr.y.sh

#combine_tree
logcombiner -o o.mr.log \
-log v1/y.mr.cfg.log \
-log v2/y.mr.cfg.log \
-log v3/y.mr.cfg.log 

logcombiner -o o.mr.tree \
-log v1/y.mr.cfg-o.trees \
-log v2/y.mr.cfg-o.trees \
-log v3/y.mr.cfg-o.trees 

# tracer
mit: 9.441 e-9 s/y 3 year/generation

y: 6.449e-8 s/y 

# estimate_bsp
c_f='bsp.ohy2.xml'
grep -v 'sequence id="seq' $c_f > bsp.blank.cfg
c_f='bsp.blank.cfg'

fa_2_xml.sh hy1.fa
fa_2_xml.sh hy2.fa

for f in {hy1,hy2}.fa
do
b_k=$f.fa_xml
insert_block.py $c_f $b_k 6 bsp.$f.xml
done

run.iran_amuf.y.skyline.sh

# plot_bsp
cd /public/home/d0202110815/at42/proj/iran_amuf/review/bsp/y

for f in {ohy2,hy2,hy1}
do
p_t='../y/bsp/'
logcombiner -o mg.y.$f.log \
-log $p_t/bsp.$f.a.bsp.$f.log \
-log $p_t/bsp.$f.b.bsp.$f.log \
-log $p_t/bsp.$f.c.bsp.$f.log

logcombiner -o mg.y.$f.tree \
-log $p_t/bsp.$f.a.bsp.$f-o.trees \
-log $p_t/bsp.$f.b.bsp.$f-o.trees \
-log $p_t/bsp.$f.c.bsp.$f-o.trees
done

plot.iran_amuf.skyline.mt.r

# kk
