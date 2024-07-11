#!/usr/bin/env Rscript

#args
args <- commandArgs(trailingOnly = TRUE)

pbs_f <- args[1]
s_p <- args[2] # sheep/goat


# lib
library(tidyverse)
library(stringr)

# func
if(s_p=="sheep"){
n_m=27
}else if(s_p=="goat"){
n_m=29
}

# clean
op_n <- str_c("top1.", pbs_f)

# read
pbs <- read_tsv(pbs_f) %>% filter(Chromo %in% 1:n_m)

# clean
## top %5; p(fst) < 0.05; top 5% (disv)
pbs_sig <- pbs %>% slice_max(PBS1, prop=.01)

## overlap
write_tsv(pbs_sig, op_n)

# kk