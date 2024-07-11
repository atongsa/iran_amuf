#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/structure/snmf/plot

# cross_entropy
grep 'Cross-Entropy (masked data):' *.log | sed 's/ //g' |\
sort -k2,2n # K=13/0.410064

## Q
for f in {2..9}
do
echo -e K$f"\t"$f"\t""../run/770."$f".Q"
done > pong.filemap

## pop_order
#cut -f2 ssa.admixture.strata | sort -u > pong.pop.order

## color
```r
library(tidyverse)
library(ggsci)
my_pal <- pal_npg("nrc")(9) # , alpha = 0.7
write_lines(my_pal, 'pong.col.tsv')
```

## pop.id
inner_join.r vf.id ssa.admixture.strata 'c("X1")' snmf.strata
cut -f2 snmf.strata > pong.pop
cut -f1 snmf.strata > pong.id
grep -Fxvf pong.id vf.id

# plot
pong -m pong.filemap -i pong.pop -n pong.pop.order -l pong.col.tsv -o pong_plot -f

# local_save
ssh -L 4000:admin1:4000 cau
google-chrome-stable http://localhost:4000

# kk
