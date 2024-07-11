#!/usr/bin/env Rscript

# aim
"""
1) cal pi mean
2) wilc pi
"""

```sh
for f in *.pi
do
g_p=${f%.tsv.windowed.pi}
tail -n +2 $f | awk -vg_p=$g_p 'BEGIN{OFS="\t"}{print g_p,$0}'
done > all

cat h.txt all > all.txt
```

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/fst_pi/auto")

# lib
library(tidyverse)
library(ggpubr)
library(tidyverse)

# args
pi_auto_f <- 'all.txt'

# read
pi <- read_tsv(pi_auto_f)

# cal
pi_mean <- pi %>%
    group_by(pop) %>%
    summarise(mean(PI),sd(PI)) %>%
    rename_with(~c("pop","mean","sd"))

# compare
pi_wilcox <- compare_means(PI ~ pop, data = pi)  # wilcoxon

# write
write_tsv(pi_mean,'pi.auto.mean')
write_tsv(pi_wilcox,'pi.auto.wilcox.mean')

# kk