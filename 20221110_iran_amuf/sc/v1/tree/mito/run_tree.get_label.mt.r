#!/usr/bin/env Rscript

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/phylo/mito/tree/hap_id")

# args
tree_f <- 'mt.768.treefile'
tree_f2 <- 'mt.768.treefile2'
hap_f <- 'tree.hap.mt.tsv'
tip_num <- 768

# lib
library(treeio)
library(ggtree)
library(tidyverse)

# read_tree
tree <- read.tree(tree_f)

# add_node_label_col
tree_tsv <- tree %>%
    as_tibble %>%
    mutate(n_l=node)

tree_nl <- as.treedata(tree_tsv)

# save_tree
write.beast(tree_nl, tree_f2)

# reroot
tree2 <- ape::root(tree, outgroup="bighorn4", resolve.root = TRUE) # node=409,

tree_tsv <- tree2 %>%
    as_tibble %>%
    mutate(n_l=node)

tree_nl <- as.treedata(tree_tsv)

write.beast(tree_nl, tree_f2) # just save; no view

# save_haptype
tree_df <- tree_tsv %>%
    filter(node <= tip_num)

i_d <- c(1171, 791, 1445, 778, 1480, 1465, 1464, 1462, 685) # view the clade
h_p <- c("HA", "HB", "HD", "HC", "HE", "o.HCE", "o.HCE", "o.HCE", "o.HCE")
df <- tibble(i_d, h_p)

ld_df <- list()
for (id in 1:length(i_d)){
hp_df <- tree_df %>% filter(node %in% offspring(tree2, as.character(df[id,1]))) %>%
    select(label) %>%
    mutate(hap=as.character(df[id,2]))
ld_df[[id]] <- hp_df
}

sp_hap <- bind_rows(ld_df)

write_tsv(sp_hap, 'sp_hap.tsv')

# id_hap.strata
```sh
left_join.r ../../sam_ple/mt.strata sp_hap.tsv '"X1"' mt.hap.strata
```

# kk
