#!/usr/bin/env Rscript

# cd
setwd("/public/home/d0202110815/at42/proj/iran_amuf/phylo/y/get_label")

# args
tree_f <- 'y_1000.treefile'
tree_f2 <- 'tree.ml.y.treefile2'
hap_f <- 'sp_hap.tsv'
tip_num <- 239

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
tree2 <- ape::root(tree, node=409, resolve.root = TRUE)

tree_tsv <- tree2 %>%
    as_tibble %>%
    mutate(n_l=node)

tree_nl <- as.treedata(tree_tsv)

write.beast(tree_nl, tree_f2)

# save_haptype
tree_df <- tree_tsv %>%
    filter(node <= tip_num)

i_d <- c(335, 337) # view the clade
h_p <- c("HY1", "HY2")
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
left_join.r ../sam_ple/ram.strata sp_hap.tsv '"X1"' ram.hap.strata
```

# kk
