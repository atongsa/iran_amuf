#!/usr/bin/env bash

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/v2/p1/admixture/plot_pong

# # cross_entropy
# grep 'Cross-Entropy (masked data):' *.log | sed 's/ //g' |\
# sort -k2,2n # K=3/0.433911

## Q
for f in {2..10}
do
echo -e K$f"\t"$f"\t"" $q_f"$f".Q"
done > pong.filemap

## pop_order
#cut -f2 $strata_f | sort -u > pong.pop.order
cp $lv_f pong.pop.order

## color
```r
library(tidyverse)
library(scales)
library(ggsci)
my_pal <- pal_npg("nrc")(10) # , alpha = 0.7
#at_col <- hue_pal(c=70, l=70)(2)
col_n <- c(my_pal, at_col) # num as the k 
write_lines(my_pal, 'pong.col.tsv')
```

## pop.id
#inner_join.r vf.id ssa.admixture.strata 'c("X1")' snmf.strata
cut -f2 $strata_f > pong.pop
cut -f1 $strata_f > pong.id
#grep -Fxvf pong.id vf.id

# plot
pong -m pong.filemap -i pong.pop -n pong.pop.order -l pong.col.tsv -o pong_plot -f

# local_save
ssh -L 4000:admin2:4000 cau
google-chrome-stable http://localhost:4000

# kk
