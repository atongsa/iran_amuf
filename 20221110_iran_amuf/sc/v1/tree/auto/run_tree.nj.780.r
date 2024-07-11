#!/usr/bin/env Rscript

# wd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/phylo/auto/tree")

# lib
library(tidyverse)
library(ape)

# args
df_f <- '../dis_tance/dis.780.mdist'
nm_f <- '../dis_tance/dis.780.mdist.id'

# read
df <- read.table(df_f, header=F, sep="\t") %>% as.matrix
nm <- read_tsv(nm_f, col_names=F) %>% .[[1]] #select(X1) %>% as.vector

rownames(df) <- nm
colnames(df) <- nm

#fasta_dist <- dist.dna(fasta, model="raw", pairwise.deletion = TRUE)
tree_bionj <- bionj(df)

write.tree(tree_bionj, "nj.780.nwk")

# kk
