#!/usr/bin/env bash

# plot_conti
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/plot

# args
g=3
m_u='1e-8'

# estimate
cat id.lv | while read pop
do
printf "%s \\ \n" ../estimate/pop/$pop.mu1.final.json
done

smc++ plot -c -g 3 -x 1000 100000 smc.esti.pdf \
../estimate/pop/O.orientalis_1.mu1.final.json \
../estimate/pop/O.orientalis_2.mu1.final.json \
../estimate/pop/ME.mu1.final.json \
../estimate/pop/CEA.mu1.final.json \
../estimate/pop/SSA.mu1.final.json \
../estimate/pop/AFR.mu1.final.json \
../estimate/pop/EUR.mu1.final.json \
../estimate/pop/AME.mu1.final.json

# split
cat id.lv | while read pop
do
printf "%s \\ \n" ../estimate/split/$pop.final.json
done

smc++ plot -c -g 3 -x 1000 100000 smc.split.pdf \
../estimate/split/O.orientalis_2.final.json \
../estimate/split/ME.final.json \
../estimate/split/CEA.final.json \
../estimate/split/SSA.final.json \
../estimate/split/AFR.final.json \
../estimate/split/EUR.final.json \
../estimate/split/AME.final.json

cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/smcpp/estimate/split
grep split *json | tr -s ' ' | tr ' ' '\t' | cut -f1,3 |\
    awk 'BEGIN{FS="\t"; OFS="\t"} $2=$2*30000' | sed 's/.final.json://' > split.time.g.tsv # time*g*10^4; just guess the 10^4;

# tsv
grep -v _1 smc.split.csv > smc.split.sp.csv # keep if you want the ref line;

# kk
